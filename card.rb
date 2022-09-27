class Card

    attr_reader :value
    
    def initialize(value)
        @value = value
        @face_up = false
    end

    # def reveal
    #     @face_up = true if @face_up == false
    # end

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