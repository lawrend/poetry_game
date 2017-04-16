class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems, inverse_of: :user 
  has_many :participating_rounds, through: :poems, source: :round
  has_many :created_rounds, :foreign_key => "creator_id", :class_name => "Round"
  
  #rounds where user is a player but not creator
  def rounds_as_player
    self.participating_rounds.select {|round| round.creator_id != self.id }
  end
  
  #rounds where user is creator and round is active
  def created_and_active
    self.created_rounds.where(:active => true)
  end

  #rounds where user is creator and round is not active
  def created_and_inactive
    self.created_rounds.where(:active => false)
  end

  def rounds_with_non_submitted_poem
    self.non_submitted_poems.select {|poem| Round.find(poem.round_id)}
  end

  def player_rounds_with_non_submitted_poem
    self.player_non_submitted_poems.select do |poem|
      Round.find(poem.round_id)
    end
  end

  def created_and_active_rounds_with_non_submitted_poem
    self.created_and_active - self.rounds_with_non_submitted_poem
  end

  def created_and_inactive_rounds_with_non_submitted_poem
    self.created_and_inactive - self.rounds_with_non_submitted_poem
  end

  #all created rounds that are active plus all other rounds where the poem is not submitted
  def current_rounds
    (self.rounds_with_non_submitted_poem + self.created_rounds) - self.created_and_active
  end

  def non_submitted_poems
    self.poems.where(:submitted => false)
  end

  def submitted_poems
    self.poems.where(:submitted => true)
  end

  def player_non_submitted_poems
#    @working_poems = []
 #   self.rounds_as_player.each do |round|
  #    @working_poems << self.poems.select {|poem| poem.round_id == round.id && poem.submitted == false}
   # end
   # @working_poems.flatten

    self.non_submitted_poems.select do |poem|
      Round.find(poem.round_id).creator_id != self.id 
    end
  end

  def eligible?
  	self.max_rounds != nil && self.max_rounds > self.current_rounds.count && self.available?
  end

  def other_available_players
    @other_available_players = User.possible_players.select { |player| player.id != self.id }
  end

  def in_round?(round)
    round.users.where(:id => self.id).exists?
  end

  def self.possible_players
  	@possible_players = User.select { |player| player.eligible? }
  end

end
