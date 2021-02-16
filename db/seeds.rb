# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Participant.destroy_all
Property.destroy_all
Project.destroy_all
User.destroy_all





user_1 = User.create!(
  email: 'Chiara@chiara.com',
  password: '123456',
  company:'better rent',
  admin: false 
)

puts "User #{user_1.email} created"

user_2 = User.create!(
  email: 'megan@megan.com',
  password: '123456',
  company:'better-rent',
  admin: true
)
puts "User #{user_2.email} created"


project_1 = Project.create!(
  name: 'Better-Rent-Office',
  description: 'Better Rent Company looking for office in Berlin',
  stage: 1,
  user_id: user_1.id
)
puts "Project: #{project_1.name} created"

property_1 = Property.create!(
  project_id: project_1.id,
  user_id: user_1.id, 
  title: 'Office at friedrichstrasse',
  street: 'Friedrichstraße',
  number: '55', 
  zipcode: '10117 Berlin',
  city: 'Berlin', 
  lettable_area: 4500, 
  rent_per_sqm: 25, 
  active: true
)
puts "Property: #{property_1.street} created"


participants_1 = Participant.create!(
  user_id: user_1.id, 
  project_id: project_1.id
)
puts "Participant #{participants_1.id} created"

participants_2 = Participant.create!(
  user_id: user_2.id, 
  project_id: project_1.id
)
puts "Participant #{participants_2.id} created"