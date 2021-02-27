# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

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

property_1_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614183343/6t9isjgbclf48cpcdiw85sv0h9vz.png']
property_1 = Property.new(
  project_id: project_1.id,
  user_id: user_1.id,
  title: 'Office at Friedrichstraße',
  street: 'Friedrichstraße',
  number: '55',
  zipcode: '10117 Berlin',
  city: 'Berlin',
  lettable_area: 4500,
  rent_per_sqm: 25,
  active: true,
)
property_1_photos.each do |img|
  property_1.photos.attach(io: URI.open(img), filename: 'friedrichstrasse.png', content_type: 'image/png')
end
property_1.save
puts "Property: #{property_1.street} created"

property_2_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614182828/28uu70gvfuef1mkbd6u7uzla5ayq.jpg']
property_2 = Property.new(
  project_id: project_1.id,
  user_id: user_1.id,
  title: 'Office at Münzstraße',
  street: 'Münzstraße',
  number: '55',
  zipcode: '10117 Berlin',
  city: 'Berlin',
  lettable_area: 4500,
  rent_per_sqm: 25,
  active: true,
)
property_2_photos.each do |img|
  property_2.photos.attach(io: URI.open(img), filename: 'muenzstrasse.jpg', content_type: 'image/jpg')
end
property_2.save
puts "Property: #{property_2.street} created"

property_3_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614183491/bas1bztz1a28lvf1djnqdexcwd4j.png']
property_3 = Property.new(
  project_id: project_1.id,
  user_id: user_1.id,
  title: 'Office at Gormannstraße',
  street: 'Gormannstraße',
  number: '55',
  zipcode: '10117 Berlin',
  city: 'Berlin',
  lettable_area: 4500,
  rent_per_sqm: 25,
  active: true,
)
property_3_photos.each do |img|
  property_3.photos.attach(io: URI.open(img), filename: 'gormannstrasse.png', content_type: 'image/png')
end
property_3.save
puts "Property: #{property_3.street} created"

property_4_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614105130/vn767o8lact2j800k1g60l60qf39.jpg']
property_4 = Property.new(
  project_id: project_1.id,
  user_id: user_1.id,
  title: 'Office at Weinmeisterstraße',
  street: 'Weinmeisterstraße',
  number: '55',
  zipcode: '10117 Berlin',
  city: 'Berlin',
  lettable_area: 4500,
  rent_per_sqm: 25,
  active: true,
)
property_4_photos.each do |img|
  property_4.photos.attach(io: URI.open(img), filename: 'weinmeisterstrasse.jpg', content_type: 'image/jpg')
end
property_4.save
puts "Property: #{property_4.street} created"

property_5_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614277868/cjw23okksve64xmb2vdjk9a4k8sk.jpg']
property_5 = Property.new(
  project_id: project_1.id,
  user_id: user_1.id,
  title: 'Office at Torstraße',
  street: 'Torstraße',
  number: '55',
  zipcode: '10117 Berlin',
  city: 'Berlin',
  lettable_area: 4500,
  rent_per_sqm: 25,
  active: true,
)
property_5_photos.each do |img|
  property_5.photos.attach(io: URI.open(img), filename: 'torstrasse.jpg', content_type: 'image/jpg')
end
property_5.save
puts "Property: #{property_5.street} created"



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
