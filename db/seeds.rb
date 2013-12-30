# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create([{ email: 'mikesdesignbuild@gmail.com', password: 'x'}])
# MemberProfile.create([{ member: Member.last, name: 'Mike', interests: 'books', purpose: 'time'}])

# Boat.create([{ name: 'Gannet', seats: 6 }, { name: 'Annie B', seats: 6 }])
# Event.create([{ on_date: '2013-12-25', at_time: '7:00', boat: Boat.last }])

# Participation.create([{ event: Event.all[0].id, member: Member.all[0].id, captain: true }])

#participation = Participation.create([{ event_id: events[0].id, member_id: members[0].id, captain: true }])
