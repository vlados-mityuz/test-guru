class AddCIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :c_id, :integer
  end
end
