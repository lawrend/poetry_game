class Poem < ActiveRecord::Base
  belongs_to :user, inverse_of: :poems
  belongs_to :round
  
  enum status: [:creator_only, :round_participants, :open_to_all]
  #after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :creator_only
  end

end
