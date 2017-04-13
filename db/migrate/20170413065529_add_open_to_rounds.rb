class AddOpenToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :open, :boolean, :default => true
  end
end
