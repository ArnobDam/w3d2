require 'byebug'
require_relative 'card.rb'

class Board

    attr_reader :size

    def initialize(size=4)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def populate
        arr = random_value_pairs
        #debugger
        
        index = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = Card.new(arr[index])
                index += 1
            end
        end
        
        @grid
        #debugger
    end

    def random_value_pairs
        unique_char_count = (size**2)/2
        alphabet = ("a".."z").to_a
        values = alphabet.sample(unique_char_count)
        value_pairs = values.concat(values)
        value_pairs.sample(value_pairs.length)
    end
    
    def render
        #populate
        @grid.each do |row|
            arr= []
            row.each do |card|
                #debugger
                arr << card.display
                
                #card.display
            end
            puts arr.join(' ')
        end
    end

    def get_pos
        p 'Please enter position of cards with formatting row,column (ie. 1,2)'
        pos = gets.chomp
        pos_str_arr = pos.split(',')
        position = [pos_str_arr[0].to_i, pos_str_arr[1].to_i]
    end

    def [](pos_arr)
        row,col = pos_arr
        @grid[row][col]
    end

    def []=(pos_arr,val)
        row,col = pos_arr
        @grid[row][col] = val
    end

    def reveal
        
        input1 = get_pos
        #debugger
        card_1 = self[input1]
        card_1.reveal_card
        render

        input2 = get_pos
        card_2 = self[input2]
        card_2.reveal_card
        render

        if card_1.value != card_2.value
            card_1.hide_card
            card_2.hide_card
        end
        render
    end

    def won?
        flat_arr = @board.flatten
        flat_arr.all? {|card| card.face_up == true}
    end
end

board = Board.new
board.populate
board.render
#p board.get_pos
#board.random_value_pairs
board.reveal