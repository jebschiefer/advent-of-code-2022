defmodule Day04 do
  def count_covered_assignments(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      String.split(x, ",", trim: true) |> Enum.map(&create_assignment_from_range/1)
    end)
    |> Enum.map(&fully_contained_assigment?/1)
    |> Enum.map(&boolean_to_integer/1)
    |> Enum.sum()
  end

  def create_assignment_from_range(range) do
    range
    |> String.split("-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(fn x, acc -> x..acc end)
    |> Enum.to_list()
    |> Enum.reverse()
  end

  def fully_contained_assigment?(assignment_group) do
    assignment_group |> left_contains_right?() ||
      assignment_group |> Enum.reverse() |> left_contains_right?()
  end

  defp left_contains_right?(assignment_group) do
    assignment_group
    |> Enum.reduce(fn x, acc ->
      MapSet.subset?(MapSet.new(x), MapSet.new(acc))
    end)
  end

  defp boolean_to_integer(bool) do
    if bool, do: 1, else: 0
  end
end
