defmodule LanguageListTest do
  use ExUnit.Case

  describe "new/1" do
    test "returns a empty list" do
      assert LanguageList.new() == []
    end
  end

  describe "add/2" do
    test "should add a item in a list" do
      result1 =
        LanguageList.new()
        |> LanguageList.add("Elixir")

      result2 =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Python")

      result3 =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Python")
        |> LanguageList.add("Erlang")

      assert result1 == ["Elixir"]
      assert result2 == ["Python", "Elixir"]
      assert result3 == ["Erlang", "Python", "Elixir"]
    end
  end

  describe "remove/1" do
    test "should remove the first item of the list" do
      list1 = ["Erlang", "Python", "Elixir"]
      list2 = ["Python", "Elixir"]
      list3 = ["Elixir"]

      assert LanguageList.remove(list1) == ["Python", "Elixir"]
      assert LanguageList.remove(list2) == ["Elixir"]
      assert LanguageList.remove(list3) == []
    end
  end

  describe "first/1" do
    test "should returns the first item of the list" do
      list1 = ["Erlang", "Python", "Elixir"]
      list2 = ["Python", "Elixir"]
      list3 = ["Elixir"]

      assert LanguageList.first(list1) == "Erlang"
      assert LanguageList.first(list2) == "Python"
      assert LanguageList.first(list3) == "Elixir"
    end
  end

  describe "count/1" do
    test "should returns the language quantity" do
      list1 = ["Erlang", "Python", "Elixir"]
      list2 = ["Python", "Elixir"]
      list3 = ["Elixir"]

      assert LanguageList.count(list1) == 3
      assert LanguageList.count(list2) == 2
      assert LanguageList.count(list3) == 1
    end
  end

  describe "functional_list/1" do
    test "should returns true if 'Elixir' in the list" do
      list1 = ["Erlang", "Python", "Elixir"]
      list2 = ["Python", "JavaScript"]
      list3 = ["Elixir", "Python", "Erlang"]

      assert LanguageList.functional_list?(list1) == true
      assert LanguageList.functional_list?(list2) == false
      assert LanguageList.functional_list?(list3) == true
    end
  end
end
