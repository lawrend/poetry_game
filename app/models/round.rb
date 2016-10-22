class Round < ActiveRecord::Base
  has_many :poems
  has_many :participants, through: :poems, :foreign_key => "user_id"
  belongs_to :creator, :class_name => "User"
end
