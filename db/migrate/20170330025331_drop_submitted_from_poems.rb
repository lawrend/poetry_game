class DropSubmittedFromPoems < ActiveRecord::Migration
  def change
  	remove_column :poems, :submitted 
  end
end
