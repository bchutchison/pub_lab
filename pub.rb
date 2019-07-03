class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def drinks_count
    return @drinks.size
  end

  def drink_array
    return @drinks
  end 

  def sell_drink(drink)
    @drinks.delete(drink)
  end

  def increase_money(drink)
    @till += drink.price
  end

end
