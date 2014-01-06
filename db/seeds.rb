# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.destroy_all
Member.create!([ 
{ name: 'MikeS', interests: 'books', purpose: 'time' }
])

#MemberProfile.destroy_all
#MemberProfile.create!([
#{ member: Member.last, name: 'Mike', interests: 'books', purpose: 'time'}
#])

Location.destroy_all
Location.create!([
{ name: 'MG', description: 'dock at Maritime Gloucester', address: '1 Harbor Loop', is_default: true},
{ name: 'TC', description: 'Treble Cove', address: 'Gloucester, MA'}
])

Boat.destroy_all
Boat.create!([
{ name: 'Gannet', seats: 6, location: Location.last }, 
{ name: 'Annie B', seats: 6, location: Location.first }
])


EventCategory.destroy_all
EventCategory.create!([
{ name: 'row'},
{ name: 'open_meeting'},
{ name: 'workout'},
{ name: 'meeting'}
])
# EventCategory.first.event_types
# EventCategory.create!([{ name: 'row'}])

EventType.destroy_all
EventType.create!([
{ name: 'Rec', long_name: 'Recreational row', description: 'Two breaks', event_category: EventCategory.first },
{ name: 'Cond', long_name: 'Conditioning row', description: 'One break', event_category: EventCategory.first },
{ name: 'Race', long_name: 'Race practice', description: 'an intense practice for a race', event_category_id: EventCategory.last.id.to_s },
{ name: 'RaceDay', long_name: 'Race on race day', description: 'Actual race on race day', event_category_id: EventCategory.last.id.to_s }
])

# Event.destroy_all
#Event.create!([{ event_type: Event.first, location: Location.first, boat: Boat.first, on_date: 1.day.from_now, at_time: 1.hour.from_now }])
Event.create!([{ event_type: EventType.first, location: Location.first, boat: Boat.first, start_datetime: 24.hours.from_now, end_datetime: 25.hours.from_now }])

# FAILED:  ActiveSupport::TimeZone['UTC'].parse("10/17/2008")
# WORKED: ActiveSupport::TimeZone['UTC'].parse("2008-12-17"), failed in create


# SQLite3::SQLException: no such column: event_types.event_category_id:   event_types.event_category_id
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