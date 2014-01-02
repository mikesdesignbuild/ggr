class Location < ActiveRecord::Base  
  include ApplicationHelper

  # belongs_to :boat, :event  polymorphic ???
  validates :name, presence: true, uniqueness: true, simple_word: true
  validates :description, presence: true, simple_text: true
  validates :address, presence: true, simple_text: true
  validates :is_default, boolean: true
end


