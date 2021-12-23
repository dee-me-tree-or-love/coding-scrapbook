defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  @test_instance Player

  test "get_state returns current state" do
    {:ok, _} = @test_instance.start_link({0, 0, :S, "Frodo"})
    {:ok, state} = @test_instance.get_state("Frodo")
    assert state == {0, 0, :S, "Frodo"}
  end

  test "move :N increases player coordinate by 1 vertically " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "Frodo"})
    :ok = @test_instance.move({:N, "Frodo"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("Frodo")
    assert {x, y} == {5, 6}
  end

  test "move :S decreases player coordinate by 1 vertically " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "Frodo"})
    :ok = @test_instance.move({:S, "Frodo"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("Frodo")
    assert {x, y} == {5, 4}
  end

  test "move :E increases player coordinate by 1 horizontaly " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "Frodo"})
    :ok = @test_instance.move({:E, "Frodo"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("Frodo")
    assert {x, y} == {6, 5}
  end

  test "move :W decreases player coordinate by 1 horizontaly " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "Frodo"})
    :ok = @test_instance.move({:W, "Frodo"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("Frodo")
    assert {x, y} == {4, 5}
  end
end
