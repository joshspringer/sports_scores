# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
p 'creating a score'
score = Score.new({
  home_team: Faker::Team.name,
  home_team_score: rand(59),
  away_team: Faker::Team.name,
  away_team_score: rand(59),
  date: Faker::Date.between(30.days.ago, Date.today)
  })
score.save
end
