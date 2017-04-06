class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems, inverse_of: :user 
  has_many :participating_rounds, through: :poems, source: :round
  has_many :created_rounds, :foreign_key => "creator_id", :class_name => "Round"
  
  def current_rounds
  	self.participating_rounds.select {|round| round.creator_id != self.id }.count + self.created_rounds.count
  end

  def eligible?
  	self.max_rounds != nil && self.max_rounds > self.current_rounds && self.available?
  end

  def other_available_players
    @other_available_players = User.possible_players.select { |player| player.id != self.id }
  end

  def self.possible_players
  	@possible_players = User.select { |player| player.eligible? }
  end

end
