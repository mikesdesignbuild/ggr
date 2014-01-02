# Ex: row, meeting, workout
class EventCategory < ActiveRecord::Base
  include ApplicationHelper

  belongs_to  :event_type, inverse_of: :category

  validates :name, presence: true, uniqueness: true, simple_word: true
end
