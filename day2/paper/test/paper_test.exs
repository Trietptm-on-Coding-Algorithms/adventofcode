defmodule PaperTest do
  use ExUnit.Case
  doctest Paper

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "2x3x4 totals 58" do
    assert 58 == Paper.total?({2,3,4})
  end

  test "2x3x4 needs 6 slack" do
    assert 6 == Paper.slack?({2,3,4})
  end

  test "2x3x4 needs 52 sqft" do
    assert 52 == Paper.surface?({2,3,4})
  end

  test "1x1x10 totals 43" do
    assert 43 == Paper.total?({1,1,10})
  end

  test "1x1x10 needs 1 slack" do
    assert 1 == Paper.slack?({1,1,10})
  end

  test "1x1x10 needs 42 sqft" do
    assert 42 == Paper.surface?({1,1,10})
  end

  test "2x3x4 needs 10 ft ribbon" do
    assert 10 == Paper.ribbon?({2,3,4})
  end

  test "2x3x4 needs 24 ft bow" do
    assert 24 == Paper.bow?({2,3,4})
  end

  test "2x3x4 totals 34 ft ribbon" do
    assert 34 == Paper.total_ribbon?({2,3,4})
  end

  test "1x1x10 needs 4 ft ribbon" do
    assert 4 == Paper.ribbon?({1,1,10})
  end

  test "1x1x10 needs 10ft bow" do
    assert 10 == Paper.bow?({1,1,10})
  end

  test "1x1x10 totals 14 ft ribbon" do
    assert 14 == Paper.total_ribbon?({1,1,10})
  end
end
