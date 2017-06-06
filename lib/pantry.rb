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
      result[ingredient_info[0]] = converted_info
      result
    end
  end

  def convert_quantity(quantity)
    if quantity < 1
      format_converted_information(quantity * 1000.00, "Milli-Units")
    elsif quantity > 100
      format_converted_information(quantity / 100.00, "Centi-Units")
    else
      format_converted_information(quantity, "Universal Units")
    end
  end

  def format_converted_information(converted, unit)
    formatted = {quantity: 0, units: ""}
    formatted[:quantity] = converted
    formatted[:units] = unit
    formatted
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, quantity|
      
      if @shopping_list[ingredient]
        @shopping_list[ingredient] += quantity
      else
        @shopping_list[ingredient] = quantity
      end
    end
  end
end
