# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.destroy_all
Member.create([{ email: 'mikesdesignbuild@gmail.com', password: 'x'}])

MemberProfile.destroy_all
MemberProfile.create([{ member: Member.last, name: 'Mike', interests: 'books', purpose: 'time'}])

Boat.destroy_all
Boat.create([{ name: 'Gannet', seats: 6 }, { name: 'Annie B', seats: 6 }])

EventLocation.destroy_all
EventLocation.create([{ name: 'MG', description: 'dock at Maritime Gloucester', address: '1 Harbor Loop'}])

EventType.create([
{ name: 'Rec', long_name: 'Recreational row', description: 'Two breaks'},
{ name: 'Cond', long_name: 'Conditioning row', description: 'One break'},
{ name: 'Race', long_name: 'Race practice', description: 'an intense practice for a race'},
{ name: 'RaceDay', long_name: 'Race on race day', description: 'Actual race on race day'}
])

# Event.create([{ on_date: '2013-12-25', at_time: '7:00', boat: Boat.last }])

# Participation.create([{ event: Event.all[0].id, member: Member.all[0].id, captain: true }])

#participation = Participation.create([{ event_id: events[0].id, member_id: members[0].id, captain: true }])


#include 'open-uri'

#EventLocations.destroy_all
#open('event_locations.txt') do |locations|
#  locations.read.each_line do |location|
#    name, description, address = location.chomp.split("|")
#    EventLocation.create!(name: name, description: description, address: address)
#  end
#end

# seed_data(EventLocation)
# seed_data(EventLocation)
# seed_data(EventLocation)
# seed_data(EventLocation)