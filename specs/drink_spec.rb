require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../drink')

class DrinkTest < Minitest::Test

    def setup()
        @drink = Drink.new('lager', 4.49)
    end

    def test_drink_name()
        assert_equal('lager', @drink.name())
    end

    def test_drink_price()
        assert_equal(4.49, @drink.price())
    end

end