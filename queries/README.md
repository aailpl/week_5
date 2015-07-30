# ActiveRecord Queries

Let's exercise your querying chops!

## Part I

A `Team` and `Player` models have already been created for you, as well as the
necessary code to create the tables and populate them with the following data:

```ruby
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
```

You should be able to get all of this by running `ruby populate.rb`

## Part II

Open the `queries.rb` file and write the following queries:

1. Get all the players for the first team
2. Get the team with the name "Cavs"
3. Get all players with the "PG" position for the team "Cavs"
4. Get the first 2 teams
5. Get all players of the "PG" position in reverse order by the time they were
   created (Newest to oldest)
6. Get the second and third teams
7. Get the players with ids 3 and 4, using the SQL IN clause
8. Count all the players with the "SF" position

At any point you should be able to run the file with `ruby queries.rb`.
