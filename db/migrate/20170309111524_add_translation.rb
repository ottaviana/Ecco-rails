class AddTranslation < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :translated_headline, :string
    add_column :articles, :translated_article, :string
    add_column :articles, :translated_description, :string
  end
end
