defmodule AdventOfCode.DayFour do
  def adventcoin_number(prefix) do
    adventcoin_number(prefix, 1)
  end
  def adventcoin_number(prefix, i) do
    case :crypto.hash(:md5, prefix <> Integer.to_string(i)) |> Base.encode16 do
      "000000" <> _ -> i
      _ -> adventcoin_number(prefix, i+1)
    end
  end
end
