require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class PubTest < Minitest::Test

    def setup()
        @pub = Pub.new('The Blue Blazer', 100)
        @drink1 = Drink.new('lager', 5, 3)
        @drink2 = Drink.new('bitter', 4, 2)
        @drink3 = Drink.new('cider', 4, 4)
        @drink4 = Drink.new('wine', 6, 3)
        @drink5 = Drink.new('coke', 2, 0)
        @drinks_array = [@drink1, @drink2, @drink3, @drink4, @drink5]
        @drinks_array.each { |drink| @pub.add_drink(drink) }
        @customer1 = Customer.new('Graham', 31, 100)
        @customer2 = Customer.new('Noddy', 10, 1)
        @customer3 = Customer.new('Joe', 18, 1000)
        @food1 = Food.new('Fish and Chips', 7, 6)
        @food2 = Food.new('Scampi and Chips', 9, 8)
        @food3 = Food.new('Chicken and Chips', 6, 8)
        @food4 = Food.new('Roast Beef', 12, 10)
        @food5 = Food.new('Broccoli', 2, 1)
        @food_array = [@food1, @food2, @food3, @food4, @food5]
        @food_array.each { |food| @pub.add_food(food) }
    end

    def test_pub_name()
        assert_equal('The Blue Blazer', @pub.name())
    end

    def test_pub_till()
        refute_nil(@pub.till())
    end

    def test_pub_drinks()
        refute_nil(@pub.drinks())
    end

    def test_add_drink()
        @pub.add_drink(@drink1) # Tests re-adding drink 1.
        assert_equal(6, @pub.drinks().count())
    end

    def test_increase_till()
        assert_equal(150.00, @pub.increase_till(50.00))
    end

    def test_check_for_drink()
        assert_equal(true, @pub.check_for_drink(@drink1))
    end

    def test_sell_drink__over_18()
        @pub.sell_drink(@drink1, @customer1)
        assert_equal(105, @pub.till())
        assert_equal(95, @customer1.wallet())
    end

    def test_sell_drink__under_18()
        @pub.sell_drink(@drink1, @customer2)
        assert_equal(100, @pub.till())
        assert_equal(1, @customer2.wallet())
    end

    def test_sell_drink__drunker()
        @pub.sell_drink(@drink1, @customer1)
        assert_equal(3, @customer1.drunkenness())
    end

    def test_check_customer_age__true()
        assert_equal(true, @pub.check_customer_age(@customer1))
    end

    def test_check_customer_age__false()
        assert_equal(false, @pub.check_customer_age(@customer2))
    end

    def test_check_customer_drunkeness__true()
        @customer1.get_drunk(21)
        assert_equal(true, @pub.check_drunk(@customer1))
    end

    def test_check_customer_drunkeness__false()
        assert_equal(false, @pub.check_drunk(@customer1))
    end

    def test_refuse_service_when_drunk()
        @customer1.get_drunk(21)
        @pub.sell_drink(@drink1, @customer1)
        assert_equal(21, @customer1.drunkenness())
    end
    
    def test_add_food()
        @pub.add_food(@food1) # Tests re-adding food 1.
        assert_equal(6, @pub.food().count())
    end

    def test_sell_food
        @pub.sell_food(@food1, @customer1)
        assert_equal(93, @customer1.wallet())
        assert_equal(107, @pub.till())
    end

    def test_food_rejuvinates()
        @customer1.get_drunk(22)
        @customer1.rejuvenate(3)
        assert_equal(19, @customer1.drunkenness())    
    end

end


