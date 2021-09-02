class AddTestsCIdNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :c_id, false)
  end
end
