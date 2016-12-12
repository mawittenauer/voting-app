# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "mikewittenauer@me.com", full_name: "Mike Wittenauer", password: "maw22828158")

iphone_android = Campaign.create(title: "Iphone vs. Android")

iphone = Side.create(title: "Iphone", campaign: iphone_android)
android = Side.create(title: "Android", campaign: iphone_android)

Comment.create(content: "Iphone is always the way to go!", user: user, campaign: iphone_android)
