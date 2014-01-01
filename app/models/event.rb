class Event < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations

  has_one :participation
  accepts_nested_attributes_for :participation
  #has_one  :boat

#    t.date     "on_date"
#    t.time     "at_time"
#    t.datetime "created_at"
#    t.datetime "updated_at"
end
