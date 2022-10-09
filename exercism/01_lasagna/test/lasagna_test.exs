defmodule LasagnaTest do
  use ExUnit.Case

  describe "expected_minutes_in_oven/0" do
    test "returns the expected minutes in oven" do
      assert Lasagna.expected_minutes_in_oven() == 40
    end
  end

  describe "remaining_minutes_in_oven/1" do
    test "returns the remaining minutes in oven" do
      assert Lasagna.remaining_minutes_in_oven(10) == 30
      assert Lasagna.remaining_minutes_in_oven(20) == 20
      assert Lasagna.remaining_minutes_in_oven(30) == 10
      assert Lasagna.remaining_minutes_in_oven(40) == 0
    end
  end

  describe "preparation_time_in_minutes/1" do
    test "returns the preparation time minutes for prepare the lasagna" do
      assert Lasagna.preparation_time_in_minutes(1) == 2
      assert Lasagna.preparation_time_in_minutes(2) == 4
      assert Lasagna.preparation_time_in_minutes(5) == 10
      assert Lasagna.preparation_time_in_minutes(10) == 20
    end
  end

  describe "total_time_in_minutes/2" do
    test "returns the total time in minutes for prepare the lasagna" do
      assert Lasagna.total_time_in_minutes(3, 20) == 26
      assert Lasagna.total_time_in_minutes(5, 20) == 30
      assert Lasagna.total_time_in_minutes(3, 40) == 46
      assert Lasagna.total_time_in_minutes(1, 10) == 12
    end
  end

  describe "alarm/0" do
    test "returns a message indicating that the lasagna is ready to eat." do
      assert Lasagna.alarm == "Ding!"
    end
  end
end
