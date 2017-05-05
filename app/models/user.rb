class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  has_many :poems, inverse_of: :user, dependent: :destroy
  has_many :participating_rounds, through: :poems, source: :round
  has_many :created_rounds, :foreign_key => "creator_id", :class_name => "Round", dependent: :destroy

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

  #all active rounds
  def all_active_rounds
    self.rounds_as_player + self.created_and_active
  end

  #all rounds with non submitted poems - NOTE: does NOT include created and inactive rounds
  def rounds_with_non_submitted_poem
    self.all_active_rounds.select do |round|
      !self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  def created_rounds_with_non_submitted_poem
    self.created_and_active.select do |round|
      !self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  def player_rounds_with_non_submitted_poem
    self.rounds_as_player.select do |round|
      !self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  def player_rounds_with_submitted_poems
    self.rounds_as_player.select do |round|
      self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  #all created, active, and open rounds
  def created_and_active_and_open
    self.created_and_active.select {|round| round.open?}
  end

  #all created, active, not open rounds
  def created_and_active_and_not_open
    self.created_and_active.select {|round| !round.open?}
  end

  #all created, active, open rounds with submitted poems - NOTE: These are counted as part of 'current rounds'
  def created_and_open_with_submitted_poem
    self.created_and_active_and_open.select do |round|
      self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  #all created, active, not open rounds with non-submitted poems
  def created_and_not_open_with_non_submitted_poem
    self.created_and_active_and_not_open.select do |round|
      !self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  def created_and_not_open_with_submitted_poem
    self.created_and_active_and_not_open.select do |round|
      self.poems.find_by(:round_id => round.id).submitted?
    end
  end

  #all created rounds that are active plus all other rounds where the poem is not submitted
  def current_rounds
    self.rounds_with_non_submitted_poem + self.created_and_inactive + self.created_and_open_with_submitted_poem
  end

  #all non submitted poems written as player or creator
  def non_submitted_poems
    self.poems.where(:submitted => false)
  end

  #all submitted poems
  def submitted_poems
    self.poems.where(:submitted => true)
  end

  #all non submitted poems written as a player
  def player_non_submitted_poems
    self.non_submitted_poems.select do |poem|
      Round.find(poem.round_id).creator_id != self.id
    end
  end

  #poem from the current round
  def current_round_poem(round)
    self.poems.find_by(:round_id => round.id)
  end

  def eligible?
  	self.max_rounds != nil && self.max_rounds > self.current_rounds.count && self.available?
  end

  #user method to list all other available players
  def other_available_players
    @other_available_players = User.possible_players.select { |player| player.id != self.id }
  end

  #user method to check if in a particular round as player
  def in_round?(round)
    round.users.where(:id => self.id).exists?
  end

  #class method to list all currently eligible players
  def self.possible_players
  	@possible_players = User.select { |player| player.eligible? }
  end

end
