defmodule FreelancerRatesTest do
  use ExUnit.Case

  describe "daily_rate/1" do
    test "returns the daily_rate" do
      daily_rate1 = FreelancerRates.daily_rate(50)
      daily_rate2 = FreelancerRates.daily_rate(35)
      daily_rate3 = FreelancerRates.daily_rate(10)

      assert daily_rate1 == 400.0
      assert daily_rate2 == 280.0
      assert daily_rate3 == 80.0

      assert is_float(daily_rate1)
      assert is_float(daily_rate2)
      assert is_float(daily_rate3)
    end
  end

  describe "apply_discount/2" do
    test "should apply the discount" do
      discount1 = FreelancerRates.apply_discount(150, 10)
      discount2 = FreelancerRates.apply_discount(150, 20)
      discount3 = FreelancerRates.apply_discount(150, 50)

      assert discount1 == 135.0
      assert discount2 == 120.0
      assert discount3 == 75.0

      assert is_float(discount1)
      assert is_float(discount2)
      assert is_float(discount3)
    end
  end

  describe "monthly_rate/2" do
    test "return monthly rate" do
      monthly_rate1 = FreelancerRates.monthly_rate(77, 10.5)
      monthly_rate2 = FreelancerRates.monthly_rate(120, 20)
      monthly_rate3 = FreelancerRates.monthly_rate(35, 7.3)

      assert monthly_rate1 == 12130
      assert monthly_rate2 == 16896
      assert monthly_rate3 == 5711

      assert is_integer(monthly_rate1)
      assert is_integer(monthly_rate2)
      assert is_integer(monthly_rate3)
    end
  end

  describe "days_in_budget/3" do
    test "returns the covered days quantity" do
      days_in_budget1 = FreelancerRates.days_in_budget(20000, 80, 11.0)
      days_in_budget2 = FreelancerRates.days_in_budget(30000, 80, 20)
      days_in_budget3 = FreelancerRates.days_in_budget(10000, 20, 7)

      assert days_in_budget1 == 35.1
      assert days_in_budget2 == 58.5
      assert days_in_budget3 == 67.2
    end
  end
end
