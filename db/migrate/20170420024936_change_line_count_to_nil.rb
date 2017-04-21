class ChangeLineCountToNil < ActiveRecord::Migration
  def change
  	change_column :rounds, :line_count, :integer, :default => nil
  end
end
