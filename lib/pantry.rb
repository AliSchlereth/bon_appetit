class Pantry
  attr_reader :stock,
              :shopping_list

  def initialize
    @stock          = {}
    @shopping_list  = {}
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
      result[ingredient_info[0]] = [] unless result[ingredient_info[0]]
      result[ingredient_info[0]] = converted_info
      result
    end
  end

  def convert_quantity(quantity, result = [])
    return result if quantity == 0
    if quantity < 1
      result << format_converted_information((quantity * 1000).round, "Milli-Units")
    elsif quantity > 100
      result << format_converted_information((quantity - (quantity % 100)) / 100.00, "Centi-Units")
      convert_quantity(quantity % 100, result)
    else
      result << format_converted_information(quantity - (quantity % 1), "Universal Units")
      convert_quantity(quantity % 1, result)
    end
  end


  def format_converted_information(converted, unit)
     {quantity: converted, units: unit}
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, quantity|
      add_ingredient_to_list(ingredient, quantity)
    end
  end

  def add_ingredient_to_list(ingredient, quantity)
    if @shopping_list[ingredient]
      @shopping_list[ingredient] += quantity
    else
      @shopping_list[ingredient] = quantity
    end
  end

  def print_shopping_list
    to_print = @shopping_list.reduce("") do |result, item_info|
      result += "* #{item_info[0]}: #{item_info[-1]}\n"
      result
    end
    p to_print
  end

end
