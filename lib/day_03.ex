defmodule AdventOfCode.DayThree do
  def houses_with_presents?(flight_plan) do
    visit(flight_plan)
    |> Set.size
  end

  defp visit(flight_plan) do
    set = MapSet.new
    visit(Set.put(set, {0,0}), {0, 0}, flight_plan)
  end
  defp visit(set, prev, <<direction :: utf8, flight_plan :: binary>>) do
    coord = get_new_coord(direction, prev)

    visit(Set.put(set, coord), coord, flight_plan)
  end
  defp visit(set, _, ""), do: set

  def robo_visit(flight_plan) do
    set = MapSet.new
    robo_visit(Set.put(set, {0, 0}), {0,0}, {0,0}, flight_plan)
    |> Set.size
  end
  def robo_visit(set, santa_prev, robo_prev, << s_direction :: utf8, r_direction :: utf8, flight_plan :: binary>>) do
    santa_coord = get_new_coord(s_direction, santa_prev)
    robo_coord = get_new_coord(r_direction, robo_prev)
    robo_visit(Enum.into([santa_coord, robo_coord], set),
               santa_coord, robo_coord, flight_plan)
  end
  def robo_visit(set, _, _, ""), do: set

  defp get_new_coord(?^, {x, y}), do: {x, y+1}
  defp get_new_coord(?v, {x, y}), do: {x, y-1}
  defp get_new_coord(?>, {x, y}), do: {x+1, y}
  defp get_new_coord(?<, {x, y}), do: {x-1, y}
end
