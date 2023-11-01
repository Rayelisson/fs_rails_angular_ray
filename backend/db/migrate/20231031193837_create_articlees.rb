class CreateArticlees < ActiveRecord::Migration[7.1]
  def change
    create_table :articlees do |t|
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
