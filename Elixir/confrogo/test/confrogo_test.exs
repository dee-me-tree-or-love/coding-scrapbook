defmodule ConfrogoTest do
  use ExUnit.Case
  doctest Confrogo

  test "says hi" do
    assert Confrogo.hello() == :hi
  end

  test "says heart" do
    assert Confrogo.health() == :heart
  end

  test "says frog" do
    assert Confrogo.avatar() == :frog
  end
end
