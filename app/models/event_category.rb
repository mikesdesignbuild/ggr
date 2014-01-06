# Ex: row, meeting, workout
class EventCategory < ApplicationModel
  validates :name, presence: true, uniqueness: true, simple_word: true

  has_many  :event_types  # , inverse_of: :category
end
