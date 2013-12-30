class MemberProfile < ActiveRecord::Base
  belongs_to :member

  # name: string
  # coxswain: year
  # captain: year 
  # index_member_on_name
end
