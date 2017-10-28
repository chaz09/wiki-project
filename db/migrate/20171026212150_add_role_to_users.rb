class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_index :users, :user_id
  end
end
