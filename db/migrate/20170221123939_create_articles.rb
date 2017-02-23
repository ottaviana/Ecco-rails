class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :newspaper
      t.string :headline
      t.text :description
      t.string :link
      t.string :image_url

      t.timestamps
    end
  end
end
