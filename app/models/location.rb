class Location < ApplicationModel
  # belongs_to :locatable, polymorphic: true
  # belongs_to :boat, :event  polymorphic ???
  validates :name, presence: true, uniqueness: true, simple_word: true
  validates :description, presence: true, simple_text: true
  validates :address, presence: true, simple_text: true
  validates :is_default, boolean: true

  # has_many :boats
  # has_many :events

  def boats
    #Boat.where(location:self)
    Boat.joins(:location)
  end

  def events
    Event.joins(:location)
    # Event.where(location:self)
  end
end


