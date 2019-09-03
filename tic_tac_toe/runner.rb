require 'pp'

require_relative 'board'
require_relative 'player'
require_relative 'game'

b = Board.new
p1 = Player.intake_and_create
p2 = Player.intake_and_create(p1)
game = Game.new(p1,p2,b)
game.play

