class MemberProfile < ActiveRecord::Base
  include ApplicationHelper

  has_one   :member, inverse_of: :profile
    validates :member, optional: true

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..8 } 
 
  validates :interests, simple_text: true 
  validates :purpose, simple_text: true

  validates :coxswain, date: true
  validates :captain, date: true

  validates :guest_on, date: true
  validates :joined_on, date: true
  validates :expired_on, date: true
  # def validates :active if joined_on is before today and expired_on is after today

  has_many :participations, inverse_of: :member
  has_many :events, through: :participations

end
