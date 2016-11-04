class Poem < ActiveRecord::Base
  belongs_to :user, inverse_of: :poems
  belongs_to :round
end
