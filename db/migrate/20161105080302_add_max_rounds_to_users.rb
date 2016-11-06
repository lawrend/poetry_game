class AddMaxRoundsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :max_rounds, :integer
  end
end
