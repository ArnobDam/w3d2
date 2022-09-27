class Board

    attr_reader :size

    def initialize(size)
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
    

end