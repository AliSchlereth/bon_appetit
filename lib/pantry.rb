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

end
