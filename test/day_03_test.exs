defmodule AdventOfCode.DayThreeTest do
  use ExUnit.Case
  import AdventOfCode.DayThree

  test "num_houses" do
    assert houses_with_presents?(">") == 2
    assert houses_with_presents?("^>v<") == 4
    assert houses_with_presents?("^v^v^v^v^v") == 2
  end

  test "robo santa" do
    assert robo_visit("^v") == 3
    assert robo_visit("^>v<") == 3
    assert robo_visit("^v^v^v^v^v") == 11
  end
end
