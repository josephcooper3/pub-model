class Customer 

    attr_reader(:name, :age, :wallet)

    def initialize(name, age, wallet=0)
        @name = name
        @wallet = wallet
        @age = age
    end

    def decrease_wallet(amount)
        @wallet -= amount
    end

end