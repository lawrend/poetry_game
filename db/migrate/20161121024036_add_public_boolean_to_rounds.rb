class AddPublicBooleanToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :public, :boolean, :default => true
  end
end
