class Participation < ActiveRecord::Base
  belongs_to :event
  belongs_to :member

#   t.integer  "user"
#   t.integer  "event"
#   t.text  "captain"  # want, would   I want to be captain vs. I would be willing to be captain
#    t.text  "coxswain" # want, would  I want to cox vs. I would be willing to cox
#    t.boolean  "missed"
#    t.boolean  "late"
#    t.datetime "created_at"
#    t.datetime "updated_at"
end
