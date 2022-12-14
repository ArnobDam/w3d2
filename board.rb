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
        index_arr = (0...size).to_a
        index_str = index_arr.join(' ')
        puts '  ' + index_str
        # puts '  0 1 2 3'
        @grid.each_with_index do |row,i|
            arr= []
            row.each do |card|
                #debugger
                arr << card.display
                
                #card.display
            end
            puts i.to_s + ' ' + arr.join(' ')
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
        system("clear")
        input1 = get_pos
        #debugger
        card_1 = self[input1]
        card_1.reveal_card
        system("clear")
        render

        input2 = get_pos
        card_2 = self[input2]
        card_2.reveal_card
        system("clear")
        render
        sleep(1.5)

        if card_1.value != card_2.value
            card_1.hide_card
            card_2.hide_card
            p 'Try Again'
        else
            p "It's a Match!"
        end
        #render
    end

    def won?
        flat_arr = @grid.flatten
        # debugger
        flat_arr.all? {|card| card.face_up == true}
    end
end

# board = Board.new
# board.populate
# board.render
# p board.get_pos
# board.random_value_pairs
# board.reveal
# p board.won?