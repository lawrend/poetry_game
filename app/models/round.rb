class Round < ActiveRecord::Base
  has_many :poems
  has_many :users, through: :poems
  belongs_to :creator, :class_name => "User"
end
