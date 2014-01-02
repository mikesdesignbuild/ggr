class Event < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations

  has_one :participation
  accepts_nested_attributes_for :participation

  has_one :event_type, as: :type
  has_one :event_location, as: :location
  #has_one  :boat

  # validates_format_of
  validates_datetime :on_date   # ???
  validates_inclusion_of :at_time   # ???
  #validates_presence_of ???

  # duration  default: 1.hour

  def start_datetime 
    # create_timestamp on_date at_time
  end
  
  def end_datetime
    # start_datetime + duration
  end

  def self.conflict_with_event?  # another_event : default 1 hour
  	# ae = another_event
    # events.where(start_datetime <= ae.end_datetime  && end_datetime >= ae.start_datetime
    #   && boat == ae.boat
    # ).exists?  # where events' times overlap with 
  end



#    t.date     "on_date"
#    t.time     "at_time"
#    t.datetime "created_at"
#    t.datetime "updated_at"
end
