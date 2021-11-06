class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :creator_id
    add_reference :tests, :creator, foreign_key: { to_table: :users }
  end
end
