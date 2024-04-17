class Link < ApplicationRecord
  belongs_to :user, optional: true

  has_many :views, dependent: :destroy

  before_create :generate_short_code

  scope :recent_first, -> { order(created_at: :desc) }

  validates :original_url, presence: true

  after_save_commit if: :original_url_previously_changed? do
    MetadataJob.perform_later(short_code)
  end

  def to_param
    short_code
  end

  def domain
    URI.parse(original_url).host rescue URI::InvalidURIError
  end

  def editable_by?(user)
    # if there are no user_id, then return false
    return false unless user_id?
    # if the user_id is the same as the user's id, then return true
    user_id == user&.id
  end

  private

  def generate_short_code
    short_code = SecureRandom.alphanumeric(8)
    while Link.exists?(short_code: short_code)
      short_code = SecureRandom.alphanumeric(8)
    end
    self.short_code = short_code
  end
end
