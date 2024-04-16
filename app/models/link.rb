class Link < ApplicationRecord
  has_many :views, dependent: :destroy

  before_create :generate_short_code

  scope :recent_first, -> { order(created_at: :desc) }

  validates :original_url, presence: true

  def domain
    URI.parse(original_url).host rescue URI::InvalidURIError
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
