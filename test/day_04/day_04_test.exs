defmodule Day04.Test do
  use ExUnit.Case

  ###
  # Solution tests
  ###

  test "day 4 part 1 example" do
    {:ok, input} = File.read("test/day_04/day_04_sample.txt")
    assert Day04.count_covered_assignments(input) === 2
  end

  # test "day 4 part 1" do
  #   {:ok, input} = File.read("test/day_04/day_04_input.txt")
  #   assert Day04.count_covered_assignments(input) === -1
  # end

  ###
  # Unit tests
  ###

  test "create_assignment_from_range should single assignment" do
    assert Day04.create_assignment_from_range("6-6") === [6]
  end

  test "create_assignment_from_range should handle range assignment" do
    assert Day04.create_assignment_from_range("1-6") === [1, 2, 3, 4, 5, 6]
  end
end
