class AddSubmittedToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :submitted, :boolean, :default => false 
  end
end
