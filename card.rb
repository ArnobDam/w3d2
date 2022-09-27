class Card

    def initialize
        @value = value
        @face_up = face_up
    end

    def reveal
        @face_up = true if @face_up == false
    end

    def display
        if @face_up == true
            p value
        else
            
    end
end