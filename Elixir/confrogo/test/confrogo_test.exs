defmodule ConfrogoTest do
  use ExUnit.Case
  doctest Confrogo

  test "says hi" do
    assert Confrogo.hello() == :hi
  end

  test "says frog" do
    assert Confrogo.avatar() == :frog
  end
end
