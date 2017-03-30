class Poem < ActiveRecord::Base
  belongs_to :user, inverse_of: :poems
  belongs_to :round
  
  enum staus: [:private, :participants, :public]
  after_initialize :set_default_staus, :if => :new_record?

  def set_default_status
    self.status ||= :private
  end
  
end
