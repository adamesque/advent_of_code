defmodule AdventOfCode.DayTwo do
  def wrapping_paper(dimensions) do
    area(dimensions) + extra(dimensions)
  end

  def area([l, w, h]) do
    2*l*w + 2*w*h + 2*h*l
  end

  def extra(dimensions) do
    [x, y] = smallest_dimensions(dimensions)
    x * y
  end

  def ribbon(dimensions) do
    smallest_perimeter(dimensions) + bow(dimensions)
  end

  def smallest_perimeter(dimensions) do
    [x, y] = smallest_dimensions(dimensions)
    x + x + y + y
  end

  def bow([l, w, h]) do
    l * w * h
  end

  def parse(path) do
    File.stream!(path)
    |> Stream.map(fn(str) ->
      String.strip(str)
      |> String.split("x")
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp smallest_dimensions(dimensions) do
    List.delete(dimensions, Enum.max(dimensions))
  end
end
