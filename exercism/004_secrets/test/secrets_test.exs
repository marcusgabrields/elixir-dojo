defmodule SecretsTest do
  use ExUnit.Case

  describe "secret_add/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_add(2))
    end

    test "do add operation" do
      adder1 = Secrets.secret_add(2)
      adder2 = Secrets.secret_add(34)
      adder3 = Secrets.secret_add(15)

      assert adder1.(2) === 4
      assert adder2.(23) === 57
      assert adder3.(6) === 21
    end
  end

  describe "secret_subtract/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_subtract(2))
    end

    test "do subtract operation" do
      subtractor1 = Secrets.secret_subtract(1)
      subtractor2 = Secrets.secret_subtract(5)
      subtractor3 = Secrets.secret_subtract(100)

      assert subtractor1.(2) === 1
      assert subtractor2.(5) === 0
      assert subtractor3.(97) === -3
    end
  end

  describe "secret_multiply/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_multiply(2))
    end

    test "do multiply operation" do
      multiplier1 = Secrets.secret_multiply(4)
      multiplier2 = Secrets.secret_multiply(2)
      multiplier3 = Secrets.secret_multiply(10)

      assert multiplier1.(2) === 8
      assert multiplier2.(5) === 10
      assert multiplier3.(50) === 500
    end
  end

  describe "secret_divide/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_divide(2))
    end

    test "do divide operation" do
      divider1 = Secrets.secret_divide(10)
      divider2 = Secrets.secret_divide(50)
      divider3 = Secrets.secret_divide(99)

      assert divider1.(10) === 1
      assert divider2.(5) === 0
      assert divider3.(2) === 0
    end
  end

  describe "secret_and/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_and(2))
    end

    test "do and operation" do
      ander1 = Secrets.secret_and(2)
      ander2 = Secrets.secret_and(4)
      ander3 = Secrets.secret_and(6)

      assert ander1.(6) === 2
      assert ander2.(4) === 4
      assert ander3.(2) === 2
    end
  end

  describe "secret_xor/1" do
    test "returns a function" do
      assert is_function(Secrets.secret_xor(2))
    end

    test "do and operation" do
      xorer1 = Secrets.secret_xor(2)
      xorer2 = Secrets.secret_xor(4)
      xorer3 = Secrets.secret_xor(6)

      assert xorer1.(6) === 4
      assert xorer2.(4) === 0
      assert xorer3.(2) === 4
    end
  end

  describe "secret_combine/2" do
    test "returns a function" do
      assert is_function(Secrets.secret_xor(2))
    end

    test "do combine operation" do
      multiply = Secrets.secret_multiply(7)
      divide = Secrets.secret_divide(3)
      combined = Secrets.secret_combine(multiply, divide)

      assert combined.(6) === 14
    end
  end
end
