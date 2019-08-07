require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < Minitest::Test

    def setup()
        @pub = Pub.new('The Blue Blazer', 100.00)
        @drink1 = Drink.new('lager', 4.99)
        @drink2 = Drink.new('bitter', 4.39)
        @drink3 = Drink.new('cider', 4.79)
        @drink4 = Drink.new('wine', 6.25)
        @drink5 = Drink.new('coke', 1.99)
        @drinks_array = [@drink1, @drink2, @drink3, @drink4, @drink5]
        @drinks_array.each { |drink| @pub.add_drink(drink) }
        @customer1 = Customer.new('Graham', 31, 100.00)
        @customer2 = Customer.new('Noddy', 10, 1.00)
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
        assert_equal(104.99, @pub.till())
        assert_equal(95.01, @customer1.wallet())
    end

    def test_sell_drink__under_18()
        @pub.sell_drink(@drink1, @customer2)
        assert_equal(100.00, @pub.till())
        assert_equal(1.00, @customer2.wallet())
    end

    def test_check_customer_age__true()
        assert_equal(true, @pub.check_customer_age(@customer1))
    end

    def test_check_customer_age__false()
        assert_equal(false, @pub.check_customer_age(@customer2))
    end

end


