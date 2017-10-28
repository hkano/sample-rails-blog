class Article < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 10 }
  validates_datetime :published_at, allow_blank: true

  scope :published, -> {
    where('published_at <= ? OR published_at IS NULL', Time.zone.now)
  }

  def published?
    return true if published_at.nil?
    published_at <= Time.zone.now
  end

end
