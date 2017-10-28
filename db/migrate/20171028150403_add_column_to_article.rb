class AddColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :published_at, :datetime, after: :text
  end
end
