defmodule Day04.Test do
  use ExUnit.Case

  test "day 4 part 1 example" do
    {:ok, input} = File.read("test/day_04/day_04_sample.txt")
    assert Day04.count_covered_assignments(input) === 2
  end

  # test "day 4 part 1" do
  #   {:ok, input} = File.read("test/day_04/day_04_input.txt")
  #   assert Day04.count_covered_assignments(input) === -1
  # end
end
