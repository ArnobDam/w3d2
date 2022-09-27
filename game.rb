require 'byebug'
require_relative 'card.rb'
require_relative 'board.rb'

def Game

    def initialize
        @board = Board.new
        #play
    end

    def play


        while !@board.won?
            debugger
            @board.reveal
            debugger
        end
    end

    def game_over?
        return true if @board.won?
        false
    end
end

new_game = Game.new
