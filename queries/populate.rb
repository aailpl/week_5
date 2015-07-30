require_relative 'setup'

ActiveRecord::Schema.define do
  create_table :teams do |t|
    t.string :name
    t.timestamps
  end

  create_table :players do |t|
    t.string :name
    t.string :position
    t.integer :number
    t.integer :team_id
    t.timestamps
  end
end

team1 = Team.create name: "Warriors"
team1.players.create(name: "Klay", number: 11, position: "SG")
team1.players.create(name: "Steph", number: 30, position: "PG")
team1.players.create(name: "Iggy", number: 9, position: "SF")

team2 = Team.create name: "Cavs"
team2.players.create(name: "LeBron", number: 23, position: "SF")
team2.players.create(name: "Kyrie", number: 2, position: "PG")
team2.players.create(name: "Matthew", number: 8, position: "PG")
team2.players.create(name: "Timofey", number: 20, position: "C")

team3 = Team.create name: "Wolves"
team3.players.create(name: "Ricky", number: 9, position: "PG")
team3.players.create(name: "Andrew", number: 22, position: "SF")
team3.players.create(name: "Zach", number: 8, position: "SG")
