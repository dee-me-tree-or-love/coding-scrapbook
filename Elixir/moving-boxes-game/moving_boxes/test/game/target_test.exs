defmodule TargetTest do
  use ExUnit.Case
  doctest Target

  @test_instance Target

  test "get_state returns current state" do
    {:ok, _} = @test_instance.start_link({0, 0, "Mordor"})
    {:ok, state} = @test_instance.get_state("Mordor")
    assert state == {0, 0, 0, "Mordor"}
  end

  test "consume_box increaments" do
    {:ok, _} = @test_instance.start_link({0, 0, "Mordor"})
    :ok = @test_instance.consume_box("Mordor")
    {:ok, state} = @test_instance.get_state("Mordor")
    assert state == {0, 0, 1, "Mordor"}
  end
end
