require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')


class CustomerTest < MiniTest::Test

  def setup()

    @drink1 = Drink.new("Mojito", 10)
    @drink2 = Drink.new("White Russian", 10)
    @drink3 = Drink.new("Palinka", 10)

    @pub = Pub.new("Queens Head", 1000, [@drink1, @drink2, @drink3])

    @customer = Customer.new("Walter", 80)
  end

  def test_customer_name
    assert_equal("Walter", @customer.name)
  end

  def test_customer_wallet
    assert_equal(80, @customer.wallet)
  end

  def test_customer_buys_drink
    @customer.buys_drink_from_pub(@pub, @drink1)
    assert_equal(2, @pub.drinks_count)
    assert_equal(70, @customer.wallet)
    assert_equal(1010, @pub.till)
  end


end
