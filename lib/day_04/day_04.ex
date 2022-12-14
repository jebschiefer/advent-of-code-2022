defmodule Day04 do
  def count_covered_assignments(input, full \\ true) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      String.split(x, ",", trim: true) |> Enum.map(&create_assignment_from_range/1)
    end)
    |> Enum.map(fn x -> compare_assignments(x, full) end)
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

  def compare_assignments(assignment_group, full \\ true) do
    cond do
      full -> fully_contained_assigment?(assignment_group)
      not full -> intersected_assignments?(assignment_group)
    end
  end

  def fully_contained_assigment?(assignment_group) do
    assignment_group |> left_contains_right?() ||
      assignment_group |> Enum.reverse() |> left_contains_right?()
  end

  def intersected_assignments?(assignment_group) do
    assignment_group
    |> Enum.reduce(fn x, acc ->
      MapSet.intersection(MapSet.new(x), MapSet.new(acc))
    end)
    |> Enum.to_list()
    |> length() > 0
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
