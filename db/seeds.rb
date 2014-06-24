# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

services = [
  {
    name: "GitHub",
    logo_url: "https://avatars.githubusercontent.com/u/9919",
  },
  {
    name: "Heroku",
    logo_url: "https://avatars.githubusercontent.com/u/23211",
  },
]

services.each do |service|
  Service.create service.merge is_dynamic: true
end
