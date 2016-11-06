class AddDefaultMaxRoundsToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :max_rounds, :integer, :default => 1
  end
end
