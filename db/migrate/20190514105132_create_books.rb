class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :category_id
      t.text :name
      t.text :author
      t.integer :price

      t.timestamps
    end
  end
end
