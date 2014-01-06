class EventType < ApplicationModel
  belongs_to  :event, inverse_of: :type

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true

  has_one     :category, inverse_of: :event_types, class_name: "EventCategory"
    validates :category, presence: true
end

# TODO: create one category, create two event types with that category.  showing category should show types that use that category