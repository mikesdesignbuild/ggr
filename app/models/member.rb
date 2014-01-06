class Member < ActiveRecord::Base
  include ApplicationHelper

  has_one   :member, inverse_of: :profile
    validates :member, default: nil

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..8 } 

  validates :street, length: 50
    validates :street_shown, length: 50
  validates :mobile_number, phone: true
    validates :mobile_number_shown, default: nil
  validates :email, email: true
    validates :email_shown, default: nil

  validates :interests, simple_text: true , default: ""
  validates :purpose, simple_text: true, default: ""

  validates :coxswain, date: true, default: nil
  validates :captain, date: true, default: nil

  validates :guest_on, date: true, default: nil
  validates :joined_on, date: true, default: nil
  validates :expired_on, date: true, default: nil
  # def validates :active if joined_on is before today and expired_on is after today

  has_many :participations, inverse_of: :member
  has_many :events, through: :participations

end
