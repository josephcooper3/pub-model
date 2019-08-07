require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../food')


class FoodTest < Minitest::Test

    def setup()
        @food = Food.new("Fish and Chips", 7, 6)
    end

    def test_food_name()
        assert_equal("Fish and Chips", @food.name())
    end

    def test_food_price()
        assert_equal(7, @food.price())
    end

    def test_food_rejuvenation_level()
        assert_equal(6, @food.rejuvenation_level())
    end

end