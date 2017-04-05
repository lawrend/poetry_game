class AddLineSyllableCountsToRounds < ActiveRecord::Migration
  def change
  	add_column :rounds, :line1_syllable_count, :integer, :default => 1
  	add_column :rounds, :line2_syllable_count, :integer, :default => 0
  	add_column :rounds, :line3_syllable_count, :integer, :default => 0
  	add_column :rounds, :line4_syllable_count, :integer, :default => 0
  	add_column :rounds, :line5_syllable_count, :integer, :default => 0
  	add_column :rounds, :line6_syllable_count, :integer, :default => 0
    add_column :rounds, :line7_syllable_count, :integer, :default => 0
  	add_column :rounds, :line8_syllable_count, :integer, :default => 0
    add_column :rounds, :line9_syllable_count, :integer, :default => 0
  	add_column :rounds, :line10_syllable_count, :integer, :default => 0
  end
end
