require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

def perform
  player1 = Player.new("José")
  player1.name
  player1.life_points
  player1.show_state
end

binding.pry

perform
