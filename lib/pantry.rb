class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    return @stock[item] if @stock[item]
    0
  end

  def restock(item, quantity)
    if @stock[item]
      @stock[item] += quantity
    else
      @stock[item] = quantity
    end
  end

  def stock_recipe(recipe)
    recipe.ingredients.each do |ingredient, quantity|
      restock(ingredient, quantity)
    end
  end

  def convert_units(recipe)
    recipe.ingredients.reduce({}) do |result, ingredient_info|
      converted_info = convert_quantity(ingredient_info[-1])
      result[ingredient_info[0]] = converted_info
      result
    end
  end

  def convert_quantity(quantity)
    if quantity < 1
      {quantity: quantity * 1000.00,
       units:    "Milli-Units"
      }
    elsif quantity > 100
      {quantity: quantity / 100.00,
       units:    "Centi-Units"
      }
    else
      {quantity: quantity,
       units:    "Universal Units"
      }
    end

  end

end
