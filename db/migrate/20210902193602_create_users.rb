class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :role

      t.timestamps
    end
    change_column_null(:users, :username, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :role, false)
  end
end
