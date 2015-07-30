# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Site.delete_all

Site.create!()
Site.create!()
Site.create!()
Site.create!()
Site.create!()

Site.first.components << VideoComponent.create!(data: "data", position: 5)
Site.first.components << TextComponent.create!(data: "data", position: 2)
Site.first.components << RatingComponent.create!(data: "data", position: 3)
Site.first.components << GalleryComponent.create!(data: "data", position: 4)
