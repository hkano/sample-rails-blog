class Comment < ApplicationRecord

  belongs_to :article

  validates :commenter, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { minimum: 1 }
  validate :validate_replied_comment_id

  def replied_to_comment?
    replied_comment_id.present?
  end

  private

  def validate_replied_comment_id
    return true if replied_comment_id.nil?
    return true if article.comments.pluck(:id).include? replied_comment_id
    errors.add(:replied_comment_id, " ID is invalid parameter")
  end

end
