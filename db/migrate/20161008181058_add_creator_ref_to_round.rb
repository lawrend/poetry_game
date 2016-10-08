class AddCreatorRefToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :creator, index: true, foreign_key: true
  end
end
