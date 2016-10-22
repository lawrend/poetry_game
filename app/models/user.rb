class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems 
  has_many :participating_rounds, through: :poems, :foreign_key => "user_id"
  has_many :created_rounds, :foreign_key => "creator_id"

end
