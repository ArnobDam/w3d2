class Card

    attr_reader :value, :face_up

    def initialize(value)
        @value = value
        @face_up = false
    end

    def reveal_card
        @face_up = true
    end

    def hide_card
        @face_up = false
    end

    def display
        if @face_up == true
            return value
        else
            return ' '
        end
        # if @face_up == true
        #     p value
        # end       
    end

end