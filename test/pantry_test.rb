require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

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

end
