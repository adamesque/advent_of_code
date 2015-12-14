defmodule AdventOfCode.DayTwoTest do
  use ExUnit.Case
  import AdventOfCode.DayTwo

  test "wrapping paper" do
    assert wrapping_paper([2, 3, 4]) == 58
    assert wrapping_paper([1, 1, 10]) == 43
  end

  test "area" do
    assert area([2, 3, 4]) == 52
    assert area([1, 1, 10]) == 42
  end

  test "extra" do
    assert extra([2, 3, 4]) == 6
    assert extra([1, 1, 10]) == 1
  end

  test "parse" do
    assert parse("test/data/day_02_sample.txt")
    |> Enum.to_list == [[1,2,3], [4,5,6], [7,8,9]]
  end

  test "ribbon" do
    assert ribbon([2, 3, 4]) == 34
    assert ribbon([1, 1, 10]) == 14
  end
end
