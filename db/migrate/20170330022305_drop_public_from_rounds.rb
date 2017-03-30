class DropPublicFromRounds < ActiveRecord::Migration
  def change
  	remove_column :rounds, :public 
  end
end
