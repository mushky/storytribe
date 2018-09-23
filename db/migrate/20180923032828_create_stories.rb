class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :tags

      t.timestamps
    end
  end
end
