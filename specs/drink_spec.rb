require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../drink')

class DrinkTest < Minitest::Test

    def setup()
        @drink = Drink.new('lager', 5, 3)
    end

    def test_drink_name()
        assert_equal('lager', @drink.name())
    end

    def test_drink_price()
        assert_equal(5, @drink.price())
    end

    def test_drink_alcohol_unites()
        assert_equal(3, @drink.alcohol_units())
    end

end