defmodule FloorsTest do
  use ExUnit.Case
  doctest Floors

  setup do
    Floors.start_link
    :ok
  end

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "get's floor" do
    assert 0 == Floors.what_floor?
  end

  test "goes up" do
    :ok = Floors.go_up
    assert 1 == Floors.what_floor?
  end

  test "goes down" do
    :ok = Floors.go_down
    assert -1 == Floors.what_floor?
  end

  test "resets floor" do
    :ok = Floors.go_up
    :ok = Floors.reset
    assert 0 == Floors.what_floor?
  end
end
