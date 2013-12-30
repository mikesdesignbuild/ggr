class Event < ActiveRecord::Base
 has_many :participations
 has_many :members, through: :participations
#    t.date     "on_date"
#    t.time     "at_time"
#    t.integer  "boat"
#    t.datetime "created_at"
#    t.datetime "updated_at"
end
