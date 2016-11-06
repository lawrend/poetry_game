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

end
