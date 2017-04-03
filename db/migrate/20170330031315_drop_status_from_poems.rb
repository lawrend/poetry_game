class DropStatusFromPoems < ActiveRecord::Migration
  def change
  	remove_column :poems, :status
  end
end
