class AddCategoriesTitleAndCIdNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :c_id, false)
  end
end
