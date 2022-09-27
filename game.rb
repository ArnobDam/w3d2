require 'byebug'
require_relative 'card.rb'
require_relative 'board.rb'

class Game

    def initialize(size=4)
        @board = Board.new(size)
        play
    end

    def play
        @board.populate

        while !@board.won?
            #debugger
            @board.reveal
            #debugger
        end
        p "You Win!"
    end

    # def game_over?
    #     if @board.won?
    #         p "You Win!"
    #         return true
    #     end
    #     false
    # end
end

new_game = Game.new(2)
