class Pub

  attr_reader :name, :till, :stock_lvl

  def initialize(name, till, drinks, food, stock_lvl)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
    @stock_lvl = stock_lvl
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

  def sells_drink_to_customer(customer, drink)
    if drinks_count > 0
      if customer.age > 25
        if customer.drunk_level < 8
          customer.spends_money(drink)
          increase_money(drink)
          sell_drink(drink)
          customer.drunk_level += drink.alcohol_level
        end
        p "Youre too drunk, go home!"
      end
      p "Youre too young, how about a coke?"
    end
  end

  def food_count
    return @food.size
  end

  def food_array
    return @food
  end

  def sell_food(food)
    @food.delete(food)
  end

  def increase_money(food)
    @till += food.price
  end

  def sells_food_to_customer(customer, food)
    if food_count > 0
      customer.spends_money(food)
      increase_money(food)
      sell_food(food)
      customer.drunk_level -= food.rejuvenation_level
    end
  end
end
