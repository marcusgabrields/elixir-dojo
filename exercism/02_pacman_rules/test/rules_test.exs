defmodule RulesTest do
  use ExUnit.Case

  describe "eat_ghost?/2" do
    test "pacman can eat a ghost" do
      assert Rules.eat_ghost?(true, true) == true
      assert Rules.eat_ghost?(true, false) == false
      assert Rules.eat_ghost?(false, true) == false
      assert Rules.eat_ghost?(false, false) == false
    end
  end

  describe "score?/2" do
    test "pacman scores" do
      assert Rules.score?(true, true) == true
      assert Rules.score?(true, false) == true
      assert Rules.score?(false, true) == true
      assert Rules.score?(false, false) == false
    end
  end

  describe "lose?/2" do
    test "pacman scores" do
      assert Rules.lose?(true, true) == false
      assert Rules.lose?(true, false) == false
      assert Rules.lose?(false, true) == true
      assert Rules.lose?(false, false) == false
    end
  end

  describe "win?/3" do
    test "pacman wins" do
      assert Rules.win?(true, true, true) == true
      assert Rules.win?(true, true, false) == true
      assert Rules.win?(true, false, true) == false
      assert Rules.win?(true, false, false) == true

      assert Rules.win?(false, true, true) == false
      assert Rules.win?(false, true, false) == false
      assert Rules.win?(false, false, true) == false
      assert Rules.win?(false, false, false) == false
    end
  end
end
