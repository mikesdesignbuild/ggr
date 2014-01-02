class EventType < ActiveRecord::Base
  include ApplicationHelper

  belongs_to  :event, inverse_of: :type
    validates :event, presence: true

  validates :name, presence: true, uniqueness: true

  has_one     :event_category, inverse_of: :event_type
    validates :event_category, presence: true
end
