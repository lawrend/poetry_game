class AddRoundRefToPoems < ActiveRecord::Migration
  def change
    add_reference :poems, :round, index: true, foreign_key: true
  end
end
