class Round < ActiveRecord::Base
  has_many :poems
  has_many :users, through: :poems
  belongs_to :creator, :class_name => "User"

  def poem_user_ids=(ids)
  	@poem_user_ids = ids.compact
  end

  def poem_user_ids
  	@poem_user_ids
  end

  def check_for_zeroes?
  	range = [*1..self.line_count]
  	range.any? do |ln|
  		self.send("line#{ln}_syllable_count") == 0
  	end
  end

  def redo_lines
		total_lines = self.line_count
		extra_lines = [*(total_lines+1)..10]
		extra_lines.each do |ln|
			case ln
			when ln = 2
				self.line2_syllable_count = 0
			when ln = 3
				self.line3_syllable_count = 0
			when ln = 4
				self.line4_syllable_count = 0
			when ln = 5
				self.line5_syllable_count = 0
			when ln = 6
				self.line6_syllable_count = 0
			when ln = 7
				self.line7_syllable_count = 0
			when ln = 8
				self.line8_syllable_count = 0
			when ln = 9
				self.line9_syllable_count = 0
			when ln = 10
				self.line10_syllable_count = 0
			end
			self.save
		end
	end

end
