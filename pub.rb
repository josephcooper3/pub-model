class Pub

    attr_reader(:name, :till, :drinks, :food)

    def initialize(name, till)
        @name = name
        @till = till
        @drinks = []
        @food = []
    end

    def add_drink(drink)
        @drinks << drink
    end

    def add_food(food)
        @food << food
    end

    def increase_till(amount)
        @till += amount
    end

    def check_for_drink(drink)
        @drinks.include?(drink)
    end

    def sell_drink(drink, customer)
        if check_for_drink(drink) && check_customer_age(customer) && !check_drunk(customer)
            price = drink.price()
            increase_till(price)
            customer.decrease_wallet(price)
            customer.get_drunk(drink.alcohol_units())
        end
    end

    def check_customer_age(customer)
        return customer.age() >= 18
    end

    def check_drunk(customer)
        return customer.drunkenness() > 20
    end

    def sell_food(food, customer)
        price = food.price()
        increase_till(price)
        customer.decrease_wallet(price)
        customer.rejuvenate(food.rejuvenation_level())
    end

end

