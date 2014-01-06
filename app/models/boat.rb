class Boat < ApplicationModel
  belongs_to :location 
  #has_one   :location   # can be changed by captain 
  #  validates :location, default: "MG" #, presence: true

  validates :name, presence: true, uniqueness: true, simple_word: true
  validates :description, default: "", simple_text: true
  validates :seats, default: 0, numericality: { only_integer: true, greater_than: 0, less_than: 100 }  # small_positive_integer  


  has_many :events   #, inverse_of: :boat

end