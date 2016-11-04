class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems, inverse_of: :user 
  has_many :participating_rounds, through: :poems, source: :round
  has_many :created_rounds, :foreign_key => "creator_id", :class_name => "Round"

end
