class ChangeColumnDefaultMaxRoundsAndLineCount < ActiveRecord::Migration
  def change
  	change_column :rounds, :line_count, :integer
  	change_column :users, :max_rounds, :integer, :default => 5
  end
end
