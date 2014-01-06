class EventType < ApplicationModel
  belongs_to  :event_category  # , class_name: "EventCategory", inverse_of: :event_types 
  # has_one     :category , class_name: "EventCategory", inverse_of: :event_types 
  #  validates :category, default: "row"

  validates :name, uniqueness: true, presence: true
  validates :description, default: ""

  has_many :events # , inverse_of: :type  # OK

end

# TODO: create one category, create two event types with that category.  showing category should show types that use that category