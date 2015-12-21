defmodule AdventOfCode.DaySixTest do
  use ExUnit.Case
  import AdventOfCode.DaySix
  @grid1 [[false, false, false, false],
          [false, false, false, false],
          [false, false, false, false],
          [false, false, false, false]]

  @line1 [false, false, true, false]

  test "grid generation" do
    assert grid(4) == @grid1
  end

  test "line_op" do
    assert line_op(@line1, :on, {1, 3}) == [false, true, true, true]
    assert line_op(@line1, :on, {3, 1}) == [false, true, true, true]
    assert line_op(@line1, :off, {1, 3}) == [false, false, false, false]
    assert line_op(@line1, :toggle, {1, 3}) == [false, true, false, true]
  end

  test "grid_op" do
    grid2 = grid_op(@grid1, :on, {1,1}, {2,2})
    assert grid2 == [[false, false, false, false],
                     [false, true, true, false],
                     [false, true, true, false],
                     [false, false, false, false]]

    assert grid_op(@grid1, :off, {0,0}, {3,3}) == @grid1
    assert grid_op(grid2, :toggle, {3,3}, {0,0}) == [[true, true, true, true],
                                                     [true, false, false, true],
                                                     [true, false, false, true],
                                                     [true, true, true, true]]
  end

  test "grid_op with string" do
    assert grid_op(@grid1, "turn on 1,1 through 2,2") == [[false, false, false, false],
                                                          [false, true, true, false],
                                                          [false, true, true, false],
                                                          [false, false, false, false]]
  end

  test "parse op" do
    assert {:on, {489, 959}, {759, 964}} = parse_op "turn on 489,959 through 759,964"
  end
end
