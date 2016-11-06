class AddPublicToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :public, :boolean, :default => true
  end
end
