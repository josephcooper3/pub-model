class Pub

    attr_reader(:name, :till, :drinks)

    def initialize(name, till=100.00, drinks=[])
        @name = name
        @till = till
        @drinks = drinks
    end

    def add_drink(drink)
        @drinks << drink
    end

    def increase_till(amount)
        @till += amount
    end

    def check_for_drink(drink)
        @drinks.include?(drink)
    end

    def sell_drink(drink, customer)
        if check_for_drink(drink) && check_customer_age(customer)
            price = drink.price()
            increase_till(price)
            customer.decrease_wallet(price)
        end
    end

    def check_customer_age(customer)
        return customer.age() >= 18
    end

end

