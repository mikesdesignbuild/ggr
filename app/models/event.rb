class Event < ApplicationModel
  def display_name
    # time_ago_in_words(start_datetime) # + " " + event_type.display_name + "-" + boat.display_name
    start_datetime.to_s + " " + event_type.display_name + "-" + boat.display_name
  end 
  belongs_to  :event_type  #, class_name: "EventType"
  #  validates :type, presence: true
  belongs_to  :location
  #  validates :location, default: Location.first  
  belongs_to  :boat
  #  validates :boat, default: Boat.first  # references boat by id

  #validates :on_date, presence: true, date: true  #, on_or_after: :today     # not saved? see start_datetime
  #validates :at_time, presence: true, time: true  # :between => '6:00am'...'9:00pm'    # not saved? see start_datetime
    # save as military time for sorting.  07:30 
  #validates :duration, default: 1  # in hours   # not saved? see end_datetime
  #validates :day_of_week   # set in database and shown and searched on.

  # calculated.  saved in database
  validates :start_datetime , datetime: true  # after sunrise
  validates :end_datetime, datetime: true  # before sunset

  has_one :participation  # needed? workaround. not stored in database.  here so that accepts_nested_attributes_for will work
  accepts_nested_attributes_for :participation

  has_many :participations #, inverse_of: :event, dependent: :destroy

  has_many :members, through: :participations  # should be only the current members on the row.

  # duration  default: 1.hour
  #def captain
    # first participation where they want to be captain, then first who would be captain
  #end

  #def coxswains
    # participations, by date, where coxswain is "want", then participations where coxswain is "would"
  #end

  #def start_datetime 
    # create_timestamp on_date + at_time
  #end
  
  #def end_datetime
    # start_datetime + duration
  #end

  #def duration
  #  end_datetime - start_datetime
  #end

  def self.my_events   # for current user  # ideally rename to participation
    # Event.where(member: current_user)
  end

  def conflict_with_event?  # another_event using same boat at same time. 
  	# ae = another_event
    # events.where(start_datetime <= ae.end_datetime  && end_datetime >= ae.start_datetime
    #   && boat == ae.boat
    # ).exists?  # where events' times overlap with 
  end

end
