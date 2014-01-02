class MemberProfile < ActiveRecord::Base
  include ApplicationHelper

  belongs_to  :member, inverse_of: :profile
    validates :member, presence: true

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..8 } 
  validates :coxswain, date: true
  validates :captain, date: true

  validates :joined_on, date: true
  validates :expired_on, date: true
  # def validates :active if joined_on is before today and expired_on is after today

end
