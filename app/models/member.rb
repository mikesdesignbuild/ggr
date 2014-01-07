class Member < ApplicationModel
  #has_one   :user, inverse_of: :profile

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..8 } 
    # default to first name + last initial.  Ex: Joe S
  validates :street, default: "" #, length: { minimum: 1, maximum: 50}
    validates :street_shown, boolean: true
  validates :mobile_number, phone: true
    validates :mobile_number_shown, boolean: true
  validates :email, email: true
    validates :email_shown, boolean: true

  validates :interests, simple_text: true , default: ""
  validates :purpose, simple_text: true, default: ""

  validates :coxswain, date: true, default: nil
  validates :captain, date: true, default: nil

  validates :guest_on, date: true, default: nil
  validates :joined_on, date: true, default: nil
  validates :expired_on, date: true, default: nil
  # def validates :active if joined_on is before today and expired_on is after today

  has_many :participations, inverse_of: :member  # participataion.member
  has_many :events, through: :participations     # event.participations ???

  def self.captains
    where(:captain == true)
  end 

  def self.coxswains
    where(:coxswain == true)
  end 

  def display_name
    name
  end

end
