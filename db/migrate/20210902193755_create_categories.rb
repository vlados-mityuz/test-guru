class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :category_id, false)
  end
end
