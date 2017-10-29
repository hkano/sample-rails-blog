class AddColumnToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :replied_comment_id, :integer, after: :article_id
  end
end
