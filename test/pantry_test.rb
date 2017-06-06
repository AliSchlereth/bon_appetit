require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class PantryTest < Minitest::Test

  # def test_pantry_exists
  #   pantry = Pantry.new
  #
  #   assert_instance_of Pantry, pantry
  # end
  #
  # def test_stock_is_an_empty_hash
  #   pantry = Pantry.new
  #
  #   assert_equal ({}), pantry.stock
  # end
  #
  # def test_stock_check_returns_quantity_of_item_in_stock
  #   pantry = Pantry.new
  #
  #   assert_equal 0, pantry.stock_check("Cheese")
  # end
  #
  # def test_restock_adds_item_to_stock
  #   pantry = Pantry.new
  #   pantry.restock("Cheese", 10)
  #
  #   assert_equal 10, pantry.stock_check("Cheese")
  # end
  #
  # def test_restock_adds_a_different_item
  #   pantry = Pantry.new
  #   pantry.restock("PB", 2)
  #
  #   assert_equal 2, pantry.stock_check("PB")
  # end
  #
  # def test_restock_adds_to_existing_stock
  #   pantry = Pantry.new
  #   pantry.restock("Cheese", 10)
  #   pantry.restock("Cheese", 20)
  #
  #   assert_equal 30, pantry.stock_check("Cheese")
  # end
  #
  # def test_pantry_stocks_a_recipe
  #   recipe = Recipe.new("Spicey Cheese Pizza")
  #   recipe.add_ingredient("Cayenne Pepper", 0.025)
  #   recipe.add_ingredient("Cheese", 75)
  #   recipe.add_ingredient("Flour", 500)
  #
  #   pantry = Pantry.new
  #   pantry.stock_recipe(recipe)
  #   stock = {"Cayenne Pepper" => 0.025,
  #            "Cheese"         => 75,
  #            "Flour"          => 500
  #           }
  #   assert_equal stock, pantry.stock
  # end
  #
  # def test_convert_units_converts_milli_units_if_quantity_is_under_1
  #   recipe = Recipe.new("Spicey Cheese Pizza")
  #   recipe.add_ingredient("Cayenne Pepper", 0.025)
  #
  #   pantry = Pantry.new
  #   converted = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"}}
  #
  #   assert_equal (converted), pantry.convert_units(recipe)
  # end
  #
  # def test_converts_units_converts_centi_untis_if_quanitty_is_over_100
  #   recipe = Recipe.new("Spicey Cheese Pizza")
  #   recipe.add_ingredient("Flour", 500)
  #
  #   pantry = Pantry.new
  #   converted = {"Flour" => {quantity: 5, units: "Centi-Units"}}
  #
  #   assert_equal converted, pantry.convert_units(recipe)
  # end
  #
  # def test_convert_units_does_not_convert_if_between_1_and_100
  #   recipe = Recipe.new("Spicey Cheese Pizza")
  #   recipe.add_ingredient("Cheese", 75)
  #
  #   pantry = Pantry.new
  #   converted = {"Cheese" => {quantity: 75, units: "Universal Units"}}
  #
  #   assert_equal converted, pantry.convert_units(recipe)
  # end
  #
  # def test_convert_units_converts_each_unit_type_dynamically
  #   recipe = Recipe.new("Spicey Cheese Pizza")
  #   recipe.add_ingredient("Cayenne Pepper", 0.025)
  #   recipe.add_ingredient("Cheese", 75)
  #   recipe.add_ingredient("Flour", 500)
  #
  #   pantry = Pantry.new
  #   converted = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
  #                "Cheese"         => {quantity: 75, units: "Universal Units"},
  #                "Flour"          => {quantity: 5, units: "Centi-Units"}
  #              }
  #   assert_equal converted, pantry.convert_units(recipe)
  # end
  #
  # def test_convert_units_converts_each_unit_type_dynamically
  #   recipe = Recipe.new("Thom Pizza")
  #   recipe.add_ingredient("Oregano", 0.035)
  #   recipe.add_ingredient("Teese", 35)
  #   recipe.add_ingredient("GF Flour", 550)
  #
  #   pantry = Pantry.new
  #   converted = {"Oregano"  => {quantity: 35, units: "Milli-Units"},
  #                "Teese"    => {quantity: 35, units: "Universal Units"},
  #                "GF Flour" => {quantity: 5.5, units: "Centi-Units"}
  #              }
  #   assert_equal converted, pantry.convert_units(recipe)
  # end
  #
  # def test_pantry_has_a_shopping_list
  #   pantry = Pantry.new
  #
  #   assert_equal ({}), pantry.shopping_list
  # end
  #
  # def test_add_to_shopping_list_adds_from_recipe
  #   recipe = Recipe.new("Thom Pizza")
  #   recipe.add_ingredient("Oregano", 0.035)
  #
  #   pantry = Pantry.new
  #   assert pantry.shopping_list.empty?
  #
  #   pantry.add_to_shopping_list(recipe)
  #
  #   refute pantry.shopping_list.empty?
  #
  # end
  #
  # def test_add_to_shopping_list_adds_each_ingredient
  #   recipe = Recipe.new("Thom Pizza")
  #   recipe.add_ingredient("Oregano", 0.035)
  #   recipe.add_ingredient("Teese", 35)
  #   recipe.add_ingredient("GF Flour", 550)
  #
  #   pantry = Pantry.new
  #   pantry.add_to_shopping_list(recipe)
  #   shopping_list = { "Oregano" => 0.035,
  #                     "Teese"   => 35,
  #                     "GF Flour"=> 550
  #                   }
  #   assert_equal shopping_list, pantry.shopping_list
  # end
  #
  # def test_add_to_shopping_list_can_add_multiple_recipes
  #   recipe_1 = Recipe.new("Thom Pizza")
  #   recipe_1.add_ingredient("Cayenne Pepper", 0.030)
  #   recipe_1.add_ingredient("Teese", 35)
  #   recipe_1.add_ingredient("GF Flour", 550)
  #
  #   recipe_2 = Recipe.new("Spicey Cheese Pizza")
  #   recipe_2.add_ingredient("Cayenne Pepper", 0.020)
  #   recipe_2.add_ingredient("Cheese", 75)
  #   recipe_2.add_ingredient("Flour", 500)
  #
  #   pantry = Pantry.new
  #   pantry.add_to_shopping_list(recipe_1)
  #   first_list_check = { "Cayenne Pepper" => 0.030,
  #                         "Teese"   => 35,
  #                         "GF Flour"=> 550
  #                       }
  #
  #   assert_equal first_list_check, pantry.shopping_list
  #
  #   pantry.add_to_shopping_list(recipe_2)
  #   second_list_check = { "Cayenne Pepper" => 0.050,
  #                         "Teese"   => 35,
  #                         "GF Flour"=> 550,
  #                         "Cheese"  => 75,
  #                         "Flour"   => 500
  #                       }
  #
  #   assert_equal second_list_check, pantry.shopping_list
  # end
  #
  # def test_format_converted_information_returns_a_converted_hash
  #   pantry = Pantry.new
  #   converted = { quantity: 25,
  #                 units:    "Units"
  #               }
  #
  #   assert_equal converted, pantry.format_converted_information(25, "Units")
  # end
  #
  # def test_add_single_new_ingredient_to_list
  #   pantry = Pantry.new
  #   assert pantry.shopping_list.empty?
  #
  #   pantry.add_ingredient_to_list("Chocolate Chips", 60)
  #
  #   refute pantry.shopping_list.empty?
  #   list = {"Chocolate Chips" => 60}
  #
  #   assert_equal list, pantry.shopping_list
  # end
  #
  # def test_add_single_repeat_item_to_shopping_list
  #   pantry = Pantry.new
  #
  #   pantry.add_ingredient_to_list("Chocolate Chips", 60)
  #   pantry.add_ingredient_to_list("Chocolate Chips", 60)
  #
  #   list = {"Chocolate Chips" => 120}
  #
  #   assert_equal list, pantry.shopping_list
  # end
  #
  # def test_print_shopping_list_prints_out_one_list_item
  #   pantry = Pantry.new
  #   pantry.add_ingredient_to_list("Chocolate Chips", 60)
  #   info_to_print = "* Chocolate Chips: 60\n"
  #
  #   assert_equal info_to_print, pantry.print_shopping_list
  # end
  #
  # def test_print_shopping_list_prints_multiple_item_list
  #   pantry = Pantry.new
  #   pantry.add_ingredient_to_list("Chocolate Chips", 60)
  #   pantry.add_ingredient_to_list("Raspberries", 20)
  #
  #   info_to_print = "* Chocolate Chips: 60\n* Raspberries: 20\n"
  #
  #   assert_equal info_to_print, pantry.print_shopping_list
  # end

  def test_convert_units_handles_unevenly_divisble_sets
    recipe = Recipe.new("SpiceyPizza")
    recipe.add_ingredient("Cayenne Pepper", 1.025)

    pantry = Pantry.new
    converted = {"Cayenne Pepper" => [{quantity: 1,   units: "Universal Units"},
                                      {quantity: 25,  units: "Milli-Units"}
                                      ]
                }
    assert_equal converted, pantry.convert_units(recipe)
  end

  def test_convert_units_handles_unevenly_divisble_greater_than_100
    recipe = Recipe.new("Spicy Cheese Pizza")
    recipe.add_ingredient("Flour", 550)
    converted = {"Flour" => [ {quantity: 5, units: "Centi-Units"},
                              {quantity: 50, units: "Universal Units"}
                            ]
                }

    pantry = Pantry.new
    assert_equal converted, pantry.convert_units(recipe)

  end

end
