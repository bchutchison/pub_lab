require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')


class PubTest < MiniTest::Test

  def setup()
    @pub = Pub.new("Queens Head", 1000, [@drink1, @drink2, @drink3])
  end

end
