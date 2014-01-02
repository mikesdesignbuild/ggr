class Member < ActiveRecord::Base
  include ApplicationHelper

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true

  validates :encrypted_password, optional: true
  validates :reset_password_token, optional: true
  validates :reset_password_sent_at, datetime: true
  validates :remember_created_at, datetime: true
  validates :sign_in_count, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }

  validates :current_sign_in_at, datetime: true
  validates :last_sign_in_at, datetime: true
  validates :current_sign_in_ip, ip_address: true
  validates :last_sign_in_ip, ip_address: true
  validates :created_at, datetime: true
  validates :updated_at, datetime: true

  has_one  :profile, inverse_of: :member, class_name: "MemberProfile"

  has_many :participations, inverse_of: :member
  has_many :events, through: :participations

end

