class Poem < ActiveRecord::Base
  belongs_to :user, inverse_of: :poems
  belongs_to :round
  
  enum status: [:creator_only, :round_participants, :open_to_all]
  
  def poem_lines
  	@poem_lines = {
  		"line1" => {
  			"syllable_count" => "#{line1_syllable_count}",
  			"text" => "#{line1}"
  		},
  		"line2" => {
  			"syllable_count" => "#{line2_syllable_count}",
  			"text" => "#{line2}"
  		},
  		"line3" => {
  			"syllable_count" => "#{line3_syllable_count}",
  			"text" => "#{line3}"
  		},
  		"line4" => {
  			"syllable_count" => "#{line4_syllable_count}",
  			"text" => "#{line4}"
  		},
  		"line5" => {
  			"syllable_count" => "#{line5_syllable_count}",
  			"text" => "#{line5}"
  		},
  		"line6" => {
  			"syllable_count" => "#{line6_syllable_count}",
  			"text" => "#{line6}"
  		},
  		"line7" => {
  			"syllable_count" => "#{line7_syllable_count}",
  			"text" => "#{line7}"
  		},
  		"line8" => {
  			"syllable_count" => "#{line8_syllable_count}",
  			"text" => "#{line8}"
  		},
  		"line9" => {
  			"syllable_count" => "#{line9_syllable_count}",
  			"text" => "#{line9}"
  		},
  		"line10" => {
  			"syllable_count" => "#{line10_syllable_count}",
  			"text" => "#{line10}"
  		},
  	}
  end

  def non_zero_lines
  	@lines = []
  	self.poem_lines.each do |key, value|
  		value.each do |key2, value2|
  			if key2 == "syllable_count" && value2 != "0"
  				@lines << key 
  			end
  		end
  	end
    @lines.compact
  end

  def lines_of_text
  	@text = []
  	self.non_zero_lines.each do |element|
  		if self.send(element) != nil
  		@text << self.send(element)
  		end
  	end
  	@text
  end

end
