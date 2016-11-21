class DropIndividualLineFieldsFromRounds < ActiveRecord::Migration
  def change
  	remove_column :rounds, :line1_syllables	
    remove_column :rounds, :line2_syllables
    remove_column :rounds, :line3_syllables
    remove_column :rounds, :line4_syllables
    remove_column :rounds, :line5_syllables
    remove_column :rounds, :line6_syllables	
    remove_column :rounds, :line7_syllables
    remove_column :rounds, :line8_syllables
    remove_column :rounds, :line9_syllables
    remove_column :rounds, :line10_syllables
  end
end
