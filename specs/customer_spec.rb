require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../customer')

class CustomerTest < Minitest::Test 

    def setup()
        @customer = Customer.new('Graham', 31, 100.00)
    end

    def test_customer_name()
        assert_equal('Graham', @customer.name())
    end

    def test_customer_wallet()
        assert_equal(100.00, @customer.wallet())
    end

    def test_decrease_wallet()
        @customer.decrease_wallet(50.00)
        assert_equal(50.00, @customer.wallet())
    end

    def test_customer_age()
        assert_equal(31, @customer.age())
    end

    def test_drunkenness()
        assert_equal(3, @customer.get_drunk(3))
    end

end