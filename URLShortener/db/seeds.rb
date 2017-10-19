# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(email: 'bob@yahoo.com')
  user2 = User.create!(email: 'joey@aol.com')
  user3 = User.create!(email: 'Jeff')
  user4 = User.create!(email: 'Georges St. Pierre')
  user5 = User.create!(email: 'Ned')

  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.generate!(user1,"itslong")
  url2 = ShortenedUrl.generate!(user2, "itslonger")

  Visit.destroy_all
  visit1 = Visit.record_visit!(user1, url2)
  visit2 = Visit.record_visit!(user2, url2)


end
