defmodule AdventOfCode.DayOneTest do
  use ExUnit.Case
  import AdventOfCode.DayOne

  test "convert" do
    assert convert("(())") |> Enum.to_list  == [1, 1, -1, -1]
  end

  test "floor for strings" do
    assert floor_for("(())") == 0
    assert floor_for("()()") == 0
    assert floor_for("))(((((") == 3
    assert floor_for(")())())") == -3
  end

  test "floor for stream" do
    assert File.stream!("test/data/day_01.txt", [], 1)
    |> floor_for == -2
  end

  test "running sum" do
    assert running_sum([1, 1, -1, -1, -1])
    |> Enum.to_list == [1, 2, 1, 0, -1]
  end

  test "basement at" do
    assert basement_at(")") == 1
    assert basement_at("()())") == 5
  end
end
