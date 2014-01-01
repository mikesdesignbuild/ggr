class EventType < ActiveRecord::Base
  belongs_to :Event
  has_one :EventCategory
end
