require_relative 'setup'

Team.first.players

Team.find_by(name: "Cavs") #Team.where(name: "Cavs").first

Team.find_by(name: "Cavs").players.where(position: "PG")

Team.first(2)

Player.where(position: "PG").order(:created_at)

Team.limit(2).offset(1)

Player.where(id: [3,4])

Player.where(position: "SF").count

