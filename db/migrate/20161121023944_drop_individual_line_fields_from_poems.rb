class DropIndividualLineFieldsFromPoems < ActiveRecord::Migration
  def change
    remove_column :poems, :line1_syllables	
    remove_column :poems, :line2_syllables
    remove_column :poems, :line3_syllables
    remove_column :poems, :line4_syllables
    remove_column :poems, :line5_syllables
    remove_column :poems, :line6_syllables	
    remove_column :poems, :line7_syllables
    remove_column :poems, :line8_syllables
    remove_column :poems, :line9_syllables
    remove_column :poems, :line10_syllables
    remove_column :poems, :line1 
    remove_column :poems, :line2
    remove_column :poems, :line3 
    remove_column :poems, :line4 
    remove_column :poems, :line5 
    remove_column :poems, :line6 
    remove_column :poems, :line7 
    remove_column :poems, :line8 
    remove_column :poems, :line9 
    remove_column :poems, :line10 

  end
end
