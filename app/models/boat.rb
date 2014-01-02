class Boat < ActiveRecord::Base 
  include ApplicationHelper

  validates :name, presence: true, uniqueness: true, simple_word: true
  validates :description, simple_text: true
  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }  # small_positive_integer  

  has_one     :location   # can be changed by captain 
    validates :location, presence: true

  has_many :events, inverse_of: :boat
end