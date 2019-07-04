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

  # def sell_drink(drink)
  #   @drinks.delete(drink)
  # end

  def sell_drink_remove_from_stock(drink)
    @stock_lvl[drink] -= 1
  end


  def increase_money(drink)
    @till += drink.price
  end

  def sells_drink_to_customer(customer, drink)
    if drinks_count > 0
      if customer.age > 25
        if customer.drunk_level < 8
          customer.buys_drink(drink)
          increase_money(drink)
          # sell_drink(drink)
          sell_drink_remove_from_stock(drink)
          customer.drunk_level += drink.alcohol_level
        end
        return "Youre too drunk, go home!"
      end
      return "Youre too young, how about a coke?"
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
      customer.buys_food(food)
      increase_money(food)
      sell_food(food)
    end
  end

  def stock_value(drink)
    value = @stock_lvl[drink] * drink.price
    return value
  end

  def buy_stock(drink, quantity)
    @stock_lvl[drink] += quantity
  end

end
