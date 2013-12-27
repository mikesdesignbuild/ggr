namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
  	User.create!(name:"Example User",
  		         email:"foo@example.com")
  	99.times do |n|
  		name = Faker::Name.name
  		email = "example-#{n+1}@gloucestergigrowers.org"
  		User.create(name:name, email:email)
  	end
  end
end