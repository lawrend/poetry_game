class AddTitleToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :title, :string
  end
end
