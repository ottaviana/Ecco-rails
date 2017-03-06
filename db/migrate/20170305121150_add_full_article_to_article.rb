class AddFullArticleToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :article, :string
  end
end
