class User

    def initialize
        puts "initialized User"
    end

    def A
        @instance = "By A"
    end

    def B
        puts @instance
    end

    # attr_accessor :id

end


a = User.new
a.A
a.B

