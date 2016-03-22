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
    assert 0 == Floors.floor?
  end

  test "goes up" do
    :ok = Floors.go_up
    assert 1 == Floors.floor?
  end

  test "goes down" do
    :ok = Floors.go_down
    assert -1 == Floors.floor?
  end

  test "resets floor" do
    :ok = Floors.go_up
    :ok = Floors.reset
    assert 0 == Floors.floor?
  end

  test "(()) is floor 0" do
    :ok = Floors.process('(())')
    assert 0 == Floors.floor?
  end

  test "()() is floor 0" do
    :ok = Floors.process('()()')
    assert 0 == Floors.floor?
  end

  test "((( is floor 3" do
    :ok = Floors.process('(((')
    assert 3 == Floors.floor?
  end

  test "(()(()( is floor 3" do
    :ok = Floors.process('(()(()(')
    assert 3 == Floors.floor?
  end

  test "))((((( is floor 3" do
    :ok = Floors.process('))(((((')
    assert 3 == Floors.floor?
  end

  test "()) is floor -1" do
    :ok = Floors.process('())')
    assert -1 == Floors.floor?
  end

  test "))( is floor -1" do
    :ok = Floors.process('))(')
    assert -1 == Floors.floor?
  end

  test "))) is floor -3" do
    :ok = Floors.process(')))')
    assert -3 == Floors.floor?
  end

  test ")())()) is floor -3" do
    :ok = Floors.process(')())())')
    assert -3 == Floors.floor?
  end

  test ") basements at 1" do
    :ok = Floors.process(')')
    assert 1 == Floors.basement?
  end

  test "()()) basements at 5" do
    :ok = Floors.process('()())')
    assert 5 == Floors.basement?
  end

  test "())() basements at 3" do
    :ok = Floors.process('())()')
    assert 3 == Floors.basement?
  end
end
