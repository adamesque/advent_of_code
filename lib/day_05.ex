defmodule AdventOfCode.DayFive do
  def nice?(str) do
    has_three_vowels?(str) && has_double_letter?(str) && !has_forbidden_strings?(str)
  end

  def vowel_count(str) do
    Regex.scan(~r/[aeiou]/, str)
    |> Enum.count
  end

  def has_three_vowels?(str) do
    String.match?(str, ~r/.*([aeiou].*){3}/)
  end

  def has_double_letter?(str) do
    String.match?(str, ~r/(.)\1/)
  end

  def has_forbidden_strings?(str) do
    # String.contains? str, ["ab", "cd", "pq", "xy"]
    String.match?(str, ~r/(ab|cd|pq|xy)/)
  end

  def has_pair?(str) do
    String.match? str, ~r/(..).*\1/
  end

  def has_sandwich?(str) do
    str =~ ~r/(.).\1/
  end

  def nicer?(str) do
    has_pair?(str) && has_sandwich?(str)
  end

  def nice_count(file, nice_fn) do
    File.stream!(file)
    |> Stream.map(&String.strip/1)
    |> Stream.filter(nice_fn)
    |> Enum.count
  end
end
