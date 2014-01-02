class Event < ActiveRecord::Base
  include ApplicationHelper

  has_one     :event_type, class_name: "Event"
    validates :event_type, presence: true

  has_one     :location
    validates :location, presence: true
  
  has_one     :boat
    validates :boat, optional: true  # references boat by id

  validates :on_date, presence: true, date: true  #, on_or_after: :today 
  validates :at_time, presence: true, time: true  # :between => '6:00am'...'9:00pm'    # ???

  has_one :participation  # workaround. not stored in database.  here so that accepts_nested_attributes_for will work
  accepts_nested_attributes_for :participation


  has_many :participations, inverse_of: :event, dependent: :destroy

  has_many :members, through: :participations

  # calculated:
  validates :start_datetime, datetime: true  # after sunrise
  validates :end_datetime, datetime: true  # before sunset

  # duration  default: 1.hour
  def captain
    # first participation where they want to be captain, then first who would be captain
  end

  def coxswains
    # participations, by date, where coxswain is "want", then participations where coxswain is "would"
  end

  def start_datetime 
    # create_timestamp on_date + at_time
  end
  
  def end_datetime
    # start_datetime + duration
  end

  def my_participation   # for current user  # ideally rename to participation
    # Event.where(member: current_user)
  end

  def self.conflict_with_event?  # another_event using same boat at same time. 
  	# ae = another_event
    # events.where(start_datetime <= ae.end_datetime  && end_datetime >= ae.start_datetime
    #   && boat == ae.boat
    # ).exists?  # where events' times overlap with 
  end

end
