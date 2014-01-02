class Boat < ActiveRecord::Base 
  validate_required :name
  validate_number :seats

  has_many :events

  def start_datetime 
    # on_date + at_time
  end
  
  def end_datetime
    # start_datetime + duration
  end

  def self.conflict_with_event?  # another_event : default 1 hour
  	# ae = another_event
    # events.where(start_datetime <= ae.end_datetime  && end_datetime >= ae.start_datetime).exists?  # where events' times overlap with 
  end

end
