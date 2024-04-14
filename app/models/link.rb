class Link < ApplicationRecord
  before_create :generate_short_code

  scope :recent_first, -> { order(created_at: :desc) }

  validates :original_url, presence: true

  private

  def generate_short_code
    self.short_code = SecureRandom.alphanumeric(8)
  end
end
