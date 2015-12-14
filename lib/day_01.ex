defmodule AdventOfCode.DayOne do
  def floor_for(instructions) do
    convert(instructions)
    |> Enum.sum
  end

  def basement_at(instructions) do
    convert(instructions)
    |> running_sum
    |> Enum.find_index(&(&1 == -1))
    |> + 1
  end

  def running_sum(converted) do
    Stream.scan(converted, &(&1 + &2))
  end

  def convert(str) when is_binary(str) do
    Stream.unfold(str, &String.next_codepoint/1)
    |> convert
  end
  def convert(stream) do
    Stream.map stream, fn(ch) ->
      case ch do
        "(" -> 1
        ")" -> -1
        _ -> 0
      end
    end
  end
end
