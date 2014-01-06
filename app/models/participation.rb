class Participation  < ApplicationModel
  belongs_to  :event, inverse_of: :participations
  #  validates :event, presence: true

  belongs_to  :member, inverse_of: :participations
  #  validates :member, presence: true

  validates :joined_on, presence: true, datetime: true
  validates :left_on, datetime: true

  validates :rower, cant_want_would: true  # only if an active member
  validates :captain, cant_want_would: true  # only if you have role of captain
  validates :coxswain, cant_want_would: true # any active member
  validates :guest, cant_want_would: true    # open to non-members

  validates :missed, boolean: true
  validates :late, boolean: true
  
#  def confirmed?
#  	left_on.blank?
#  end

end
