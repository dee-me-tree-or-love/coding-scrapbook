defmodule BoxTest do
  use ExUnit.Case
  doctest Box

  @test_instance Box

  test "get_state returns current state" do
    {:ok, _} = @test_instance.start_link({0, 0, :S, "ring"})
    {:ok, state} = @test_instance.get_state("ring")
    assert state == {0, 0, :S, "ring"}
  end

  test "move :N increases box coordinate by 1 vertically " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "ring"})
    :ok = @test_instance.move({:N, "ring"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("ring")
    assert {x, y} == {5, 6}
  end

  test "move :S decreases box coordinate by 1 vertically " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "ring"})
    :ok = @test_instance.move({:S, "ring"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("ring")
    assert {x, y} == {5, 4}
  end

  test "move :E increases box coordinate by 1 horizontaly " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "ring"})
    :ok = @test_instance.move({:E, "ring"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("ring")
    assert {x, y} == {6, 5}
  end

  test "move :W decreases box coordinate by 1 horizontaly " do
    {:ok, _} = @test_instance.start_link({5, 5, :S, "ring"})
    :ok = @test_instance.move({:W, "ring"})
    {:ok, {x, y, _, _}} = @test_instance.get_state("ring")
    assert {x, y} == {4, 5}
  end
end
