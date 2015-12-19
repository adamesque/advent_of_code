defmodule AdventOfCode.DayFourTest do
  use ExUnit.Case
  import AdventOfCode.DayFour

  test "find_adventcoin_number" do
    assert adventcoin_number("abcdef") == 609043
    assert adventcoin_number("pqrstuv") == 1048970
  end
end
