class EventType < ActiveRecord::Base
  include ApplicationHelper

  belongs_to  :event, inverse_of: :type

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  has_one     :category, inverse_of: :event_type, class_name: "EventCategory"
    validates :category, presence: true
end
