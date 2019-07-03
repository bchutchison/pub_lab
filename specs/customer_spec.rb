require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')


class CustomerTest < MiniTest::Test

  def setup()
    @customer = Customer.new("Walter", 80)
  end

end
