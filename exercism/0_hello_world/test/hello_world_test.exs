defmodule HelloWorldTest do
  use ExUnit.Case

  describe "hello/0" do
    test "greets the world" do
      assert HelloWorld.hello() == "Hello, World!"
    end
  end
end
