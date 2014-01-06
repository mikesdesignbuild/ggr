# Ex: row, meeting, workout
class EventCategory < ActiveRecord::Base
  include ApplicationHelper

  validates :name, presence: true, uniqueness: true, simple_word: true

  has_many  :event_types, inverse_of: :category

end
