class Board

    attr_reader :size

    def initialize(size=4)
        @size = size
        @grid = Array.new(size) {Array.new}
    end

    def populate
        @grid.each do |row|
            (row.length-1).times do 
                row << Card.new(val)
            end
        end
    end

    def random_value_pairs(size)
        unique_char_count = size/2
        alphabet = ("a".."z").to_a
        values = alphabet.sample(unique_char_count)
        value_pairs = values.concat(values)
        values_pairs.sample(value_pairs.length)
    end
    


end