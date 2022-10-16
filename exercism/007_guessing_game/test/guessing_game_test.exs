defmodule GuessingGameTest do
  use ExUnit.Case

  describe "compare/2" do
    test "when guess is the same as secret_number, returns 'Correct'" do
      assert GuessingGame.compare(5, 5) == "Correct"
      assert GuessingGame.compare(10, 10) == "Correct"
      assert GuessingGame.compare(34, 34) == "Correct"
    end

    test "when guess is higher than secret_number, returns 'Too high'" do
      assert GuessingGame.compare(5, 10) == "Too high"
      assert GuessingGame.compare(10, 20) == "Too high"
      assert GuessingGame.compare(1, 3) == "Too high"
    end

    test "when guess is lower than secret_number, returns 'Too low'" do
      assert GuessingGame.compare(10, 5) == "Too low"
      assert GuessingGame.compare(20, 10) == "Too low"
      assert GuessingGame.compare(3, 1) == "Too low"
    end

    test "when guess is close to secret_number, returns 'So close'" do
      assert GuessingGame.compare(20, 19) == "So close"
      assert GuessingGame.compare(10, 11) == "So close"
      assert GuessingGame.compare(3, 2) == "So close"
    end

    test "when guess is not provided, returns 'Make a guess'" do
      assert GuessingGame.compare(20) == "Make a guess"
      assert GuessingGame.compare(10, :no_guess) == "Make a guess"
      assert GuessingGame.compare(3) == "Make a guess"
    end
  end
end
