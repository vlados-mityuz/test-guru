class AddUsersUsernamePasswordAndRoleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :username, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :role, false)
  end
end
