class Participation < ActiveRecord::Base
  belongs_to :event
  belongs_to :member

#   t.integer  "user"
#   t.integer  "event"
#   t.boolean  "captain"
#    t.boolean  "coxswain"
#    t.boolean  "participated"
#    t.boolean  "late"
#    t.datetime "created_at"
#    t.datetime "updated_at"
end
