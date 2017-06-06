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

  def test_stock_cheese_adds_cheese_to_stock_hash
    pantry = Pantry.new
    
  end

end
