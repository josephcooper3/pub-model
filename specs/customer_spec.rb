require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../customer')

class CustomerTest < Minitest::Test 

    def setup()
        @customer = Customer.new('Graham', 31, 100)
    end

    def test_customer_name()
        assert_equal('Graham', @customer.name())
    end

    def test_customer_wallet()
        assert_equal(100, @customer.wallet())
    end

    def test_decrease_wallet()
        @customer.decrease_wallet(50)
        assert_equal(50, @customer.wallet())
    end

    def test_customer_age()
        assert_equal(31, @customer.age())
    end

    def test_drunkenness()
        assert_equal(3, @customer.get_drunk(3))
    end

    def test_rejuvenation()
        @customer.get_drunk(3)
        @customer.rejuvenate(2)
        assert_equal(1, @customer.drunkenness())
    end

    def test_rejuvenation_max_0()
        @customer.get_drunk(3)
        @customer.rejuvenate(100)
        assert_equal(0, @customer.drunkenness())
    end


end