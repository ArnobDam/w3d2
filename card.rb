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
        @face_up = true
        p value
        # if @face_up == true
        #     p value
        # end       
    end

end