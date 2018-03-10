class User

    @name
    @age

    def age
        @age
    end

    def age(value)
        @age = value
    end

    def printName
        puts "name"
    end

    def printAge
        puts @age
    end

end


user = User.new
user.age(15)
user.printAge