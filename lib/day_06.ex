defmodule AdventOfCode.DaySix do
  use Bitwise

  def grid(n \\ 1000) do
    for _ <- 1..n, do: (for _ <- 1..n, do: false)
  end

  @op_rxp ~r/(?:turn )?(?<op>\w+) (?<x1>\d{1,3}),(?<y1>\d{1,3}) through (?<x2>\d{1,3}),(?<y2>\d{1,3})\s?/

  def parse_op(str) do
    import String
    %{"op" => op,
      "x1" => x1,
      "y1" => y1,
      "x2" => x2,
      "y2" => y2
     } = Regex.named_captures(@op_rxp, str, capture: :all_but_first)
    {to_atom(op),
     {to_integer(x1), to_integer(y1)},
     {to_integer(x2), to_integer(y2)}}
  end

  def grid_op(grid, op_str) when is_binary(op_str) do
    {op, coord1, coord2} = parse_op(op_str)
    grid_op(grid, op, coord1, coord2)
  end

  def grid_op(grid, op, {x1, y1}, {x2, y2}) when x2 < x1 do
    grid_op(grid, op, {x2, y2}, {x1, y1})
  end
  def grid_op(grid, op, {x1, y1}, {x2, y2}) when y2 < y1 do
    grid_op(grid, op, {x1, y2}, {x2, y1})
  end
  def grid_op(grid, op, {x1, y1}, {x2, y2}) do
    Enum.with_index(grid)
    |> Enum.map fn ({line, i}) ->
      cond do
        (y1 <= i && i <= y2) -> line_op(line, op, {x1, x2})
        true -> line
      end
    end
  end

  def line_op(line, op, {i, k}) when k < i do
    line_op(line, op, {k, i})
  end
  def line_op(line, op, {start, stop}) do
    Enum.with_index(line)
    |> Enum.map fn ({val, i}) ->
      cond do
        (start <= i && i <= stop) -> op(op, val)
        true -> val
      end
    end
  end

  defp op(:on, _), do: true
  defp op(:off, _), do: false
  defp op(:toggle, val), do: !val
end
