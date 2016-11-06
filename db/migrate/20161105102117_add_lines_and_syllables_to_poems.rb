class AddLinesAndSyllablesToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :line1_syllables, :integer, :default => 1
  	add_column :poems, :line2_syllables, :integer
  	add_column :poems, :line3_syllables, :integer
  	add_column :poems, :line4_syllables, :integer
  	add_column :poems, :line5_syllables, :integer
  	add_column :poems, :line6_syllables, :integer
    add_column :poems, :line7_syllables, :integer
  	add_column :poems, :line8_syllables, :integer
    add_column :poems, :line9_syllables, :integer
  	add_column :poems, :line10_syllables, :integer
  	add_column :poems, :line1, :text
	add_column :poems, :line2, :text
	add_column :poems, :line3, :text
	add_column :poems, :line4, :text
	add_column :poems, :line5, :text
	add_column :poems, :line6, :text
	add_column :poems, :line7, :text
	add_column :poems, :line8, :text
	add_column :poems, :line9, :text
	add_column :poems, :line10, :text
  end
end
