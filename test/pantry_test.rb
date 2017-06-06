require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class PantryTest < Minitest::Test

  def test_pantry_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_stock_is_an_empty_hash
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_stock_check_returns_quantity_of_item_in_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_restock_adds_item_to_stock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_restock_adds_a_different_item
    pantry = Pantry.new
    pantry.restock("PB", 2)

    assert_equal 2, pantry.stock_check("PB")
  end

  def test_restock_adds_to_existing_stock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_pantry_stocks_a_recipe
    recipe = Recipe.new("Spicey Cheese Pizza")
    recipe.add_ingredient("Cayenne Pepper", 0.025)
    recipe.add_ingredient("Cheese", 75)
    recipe.add_ingredient("Flour", 500)

    pantry = Pantry.new
    pantry.stock_recipe(recipe)
    stock = {"Cayenne Pepper" => 0.025,
             "Cheese"         => 75,
             "Flour"          => 500
            }
    assert_equal stock, pantry.stock
  end

  def test_convert_units_converts_milli_units_if_quantity_is_under_1
    recipe = Recipe.new("Spicey Cheese Pizza")
    recipe.add_ingredient("Cayenne Pepper", 0.025)

    pantry = Pantry.new
    converted = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"}}

    assert_equal (converted), pantry.convert_units(recipe)
  end

  def test_converts_units_converts_centi_untis_if_quanitty_is_over_100
    recipe = Recipe.new("Spicey Cheese Pizza")
    recipe.add_ingredient("Flour", 500)

    pantry = Pantry.new
    converted = {"Flour" => {quantity: 5, units: "Centi-Units"}}

    assert_equal converted, pantry.convert_units(recipe)
  end

  def test_convert_units_does_not_convert_if_between_1_and_100
    recipe = Recipe.new("Spicey Cheese Pizza")
    recipe.add_ingredient("Cheese", 75)

    pantry = Pantry.new
    converted = {"Cheese" => {quantity: 75, units: "Universal Units"}}

    assert_equal converted, pantry.convert_units(recipe)
  end


end
