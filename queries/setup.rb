require 'active_record'
require_relative 'models/team'
require_relative 'models/player'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite3"
)
