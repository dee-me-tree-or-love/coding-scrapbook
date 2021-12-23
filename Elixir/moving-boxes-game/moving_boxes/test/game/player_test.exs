defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "get state returns current state" do
    {:ok, _} = Player.start_link({0, 0, :S, "Frodo"})
    {:ok, state} = Player.get_state("Frodo")
    assert state == {0, 0, :S, "Frodo"}
  end

  test "move :N increases player coordinate by 1 vertically " do
    {:ok, _} = Player.start_link({5, 5, :S, "Frodo"})
    :ok = Player.move({:N, "Frodo"})
    {:ok, {x, y, _, _}} = Player.get_state("Frodo")
    assert {x, y} == {5, 6}
  end

  test "move :S decreases player coordinate by 1 vertically " do
    {:ok, _} = Player.start_link({5, 5, :S, "Frodo"})
    :ok = Player.move({:S, "Frodo"})
    {:ok, {x, y, _, _}} = Player.get_state("Frodo")
    assert {x, y} == {5, 4}
  end

  test "move :E increases player coordinate by 1 horizontaly " do
    {:ok, _} = Player.start_link({5, 5, :S, "Frodo"})
    :ok = Player.move({:E, "Frodo"})
    {:ok, {x, y, _, _}} = Player.get_state("Frodo")
    assert {x, y} == {6, 5}
  end

  test "move :W decreases player coordinate by 1 horizontaly " do
    {:ok, _} = Player.start_link({5, 5, :S, "Frodo"})
    :ok = Player.move({:W, "Frodo"})
    {:ok, {x, y, _, _}} = Player.get_state("Frodo")
    assert {x, y} == {4, 5}
  end
end