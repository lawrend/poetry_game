class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems, inverse_of: :user 
  has_many :participating_rounds, through: :poems, source: :round
  has_many :created_rounds, :foreign_key => "creator_id", :class_name => "Round"
  
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def current_rounds
  	self.participating_rounds.count 
  end

  def eligible?
  	self.max_rounds != nil && self.max_rounds > self.current_rounds
  end

  def self.possible_players
  	@possible_players = User.select { |player| player.eligible? }
  end
  
  def set_default_role
    self.role ||= :user
  end



end
