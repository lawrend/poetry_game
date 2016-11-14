class AddUniqToUsersUsername < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string
    add_column :users, :username, :string, unique: true 
  end
end
