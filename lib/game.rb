require_relative 'board'
require_relative 'player'

class Game
    attr_accessor :activePlayer
    attr_accessor :nextPlayer

    def intialize()
        board=Board.new
        @activePlayer=Player.new('player1',"W")
        @nextPlayer=Player.new('player2',"B")
    end

    def display()
        board.display()
    end
    
end