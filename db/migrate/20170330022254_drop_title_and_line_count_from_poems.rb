class DropTitleAndLineCountFromPoems < ActiveRecord::Migration
  def change
  	remove_column :poems, :title  
  	remove_column :poems, :line_count
  end
end
