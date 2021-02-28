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

user_1_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614538014/chiara_t4ezqv.png']
user_1 = User.new(
  email: 'Chiara@chiara.com',
  password: '123456',
  company:'better rent',
  admin: false,
  user_name: 'Chiara'
)
user_1_photos.each do |img|
  user_1.photos.attach(io: URI.open(img), filename: 'chiara.png', content_type: 'image/png')
end
user_1.save
puts "User #{user_1.user_name} created"

user_2_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614538014/megan_rzqrwg.png']
user_2 = User.new(
  email: 'megan@megan.com',
  password: '123456',
  company:'better-rent',
  admin: true,
  user_name: 'Megan'
)
user_2_photos.each do |img|
  user_2.photos.attach(io: URI.open(img), filename: 'megan.png', content_type: 'image/png')
end
user_2.save
puts "User #{user_2.user_name} created"

user_3_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614538014/tobi_yn5iay.png']
user_3 = User.new(
  email: 'tobi@tobi.com',
  password: '123456',
  company:'better-rent',
  admin: true,
  user_name: 'Tobias'
)
user_3_photos.each do |img|
  user_3.photos.attach(io: URI.open(img), filename: 'tobi.png', content_type: 'image/png')
end
user_3.save
puts "User #{user_3.user_name} created"

user_4_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614538014/huy_ucvwcu.png']
user_4 = User.new(
  email: 'huy@huy.com',
  password: '123456',
  company:'better-rent',
  admin: true,
  user_name: 'Huy'
)
user_4_photos.each do |img|
  user_4.photos.attach(io: URI.open(img), filename: 'huy.png', content_type: 'image/png')
end
user_4.save
puts "User #{user_4.user_name} created"


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

# property_2_photos = ['https://res.cloudinary.com/lewagon-training/image/upload/v1614277920/3vccih7zons3xh57buiru40o4crn.jpg']
# property_2 = Property.new(
#   project_id: project_1.id,
#   user_id: user_1.id,
#   title: 'Office at Münzstraße',
#   street: 'Münzstraße',
#   number: '55',
#   zipcode: '10117 Berlin',
#   city: 'Berlin',
#   lettable_area: 4500,
#   rent_per_sqm: 25,
#   active: true,
# )
# property_2_photos.each do |img|
#   property_2.photos.attach(io: URI.open(img), filename: 'muenzstrasse.jpg', content_type: 'image/jpg')
# end
# property_2.save
# puts "Property: #{property_2.street} created"

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
