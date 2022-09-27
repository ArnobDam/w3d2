require 'byebug'
class Board

    attr_reader :size

    def initialize(size=4)
        @size = size
        @grid = Array.new(size) {Array.new}
    end

    def populate
        arr = random_value_pairs
        debugger
        arr.each do |val|
            @grid.each do |row|
                (row.length-1).times do 
                    debugger
                    row << Card.new(val)
                end
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
    
end

board = Board.new
board.populate
board.random_value_pairs