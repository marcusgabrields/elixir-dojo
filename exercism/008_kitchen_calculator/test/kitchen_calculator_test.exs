defmodule KitchenCalculatorTest do
  use ExUnit.Case

  describe "get_volume/1" do
    test "returns the volume" do
      assert KitchenCalculator.get_volume({:cup, 2.0}) == 2.0
      assert KitchenCalculator.get_volume({:teaspoon, 5.7}) == 5.7
      assert KitchenCalculator.get_volume({:tablespoon, 0.5}) == 0.5
    end
  end

  describe "to_milliliter/1" do
    test "should convert cup to milliliter" do
      assert KitchenCalculator.to_milliliter({:cup, 5.0}) == {:milliliter, 1200.0}
    end

    test "should convert fluid ounce to milliliter" do
      assert KitchenCalculator.to_milliliter({:fluid_ounce, 2.5}) == {:milliliter, 75.0}
    end

    test "should convert teaspoon to milliliter" do
      assert KitchenCalculator.to_milliliter({:teaspoon, 10.3}) == {:milliliter, 51.5}
    end

    test "should convert tablespoon to milliliter" do
      assert KitchenCalculator.to_milliliter({:tablespoon, 3.0}) == {:milliliter, 45.0}
    end

    test "should convert milliliter to milliliter" do
      assert KitchenCalculator.to_milliliter({:milliliter, 76.4}) == {:milliliter, 76.4}
    end
  end

  describe "from_milliliter/2" do
    test "shoul convert milliliter to cup" do
      assert KitchenCalculator.from_milliliter({:milliliter, 240}, :cup) == {:cup, 1.0}
    end

    test "shoul convert milliliter to fluid ounce" do
      assert KitchenCalculator.from_milliliter({:milliliter, 30}, :fluid_ounce) ==
               {:fluid_ounce, 1.0}
    end

    test "shoul convert milliliter to teaspoon" do
      assert KitchenCalculator.from_milliliter({:milliliter, 5}, :teaspoon) == {:teaspoon, 1.0}
    end

    test "shoul convert milliliter to tablespoon" do
      assert KitchenCalculator.from_milliliter({:milliliter, 15}, :tablespoon) == {:tablespoon, 1.0}
    end

    test "shoul convert milliliter to milliliter" do
      assert KitchenCalculator.from_milliliter({:milliliter, 1}, :milliliter) == {:milliliter, 1.0}
    end
  end
end
