class AddLineCountSyllableCountToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :line_count, :integer, :default => 1
  	add_column :rounds, :line1_syllables, :integer, :default => 1
  	add_column :rounds, :line2_syllables, :integer
  	add_column :rounds, :line3_syllables, :integer
  	add_column :rounds, :line4_syllables, :integer
  	add_column :rounds, :line5_syllables, :integer
  	add_column :rounds, :line6_syllables, :integer
    add_column :rounds, :line7_syllables, :integer
  	add_column :rounds, :line8_syllables, :integer
    add_column :rounds, :line9_syllables, :integer
  	add_column :rounds, :line10_syllables, :integer
  end
end
