class AddTitleAndLinesToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :line1_syllable_count, :integer
  	add_column :poems, :line2_syllable_count, :integer
  	add_column :poems, :line3_syllable_count, :integer
  	add_column :poems, :line4_syllable_count, :integer
  	add_column :poems, :line5_syllable_count, :integer
  	add_column :poems, :line6_syllable_count, :integer
    add_column :poems, :line7_syllable_count, :integer
  	add_column :poems, :line8_syllable_count, :integer
    add_column :poems, :line9_syllable_count, :integer
  	add_column :poems, :line10_syllable_count, :integer
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
	add_column :poems, :title, :text
  end
end
