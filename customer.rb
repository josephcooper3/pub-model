class Customer 

    attr_reader(:name, :age, :wallet)
    attr_accessor(:drunkenness)

    def initialize(name, age, wallet)
        @name = name
        @age = age
        @wallet = wallet
        @drunkenness = 0
    end

    def decrease_wallet(amount)
        @wallet -= amount
    end

    def get_drunk(units)
        @drunkenness += units
    end 

    def rejuvenate(units)
        units < @drunkenness ? @drunkenness -= units : @drunkenness = 0
    end

end