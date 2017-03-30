class AddStatusToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :status, :integer, :default => 0
  end
end
