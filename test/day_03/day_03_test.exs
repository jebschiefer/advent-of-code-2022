defmodule Day03.Test do
  use ExUnit.Case

  test "day 3 part 1 example" do
    {:ok, input} = File.read("test/day_03/day_03_sample.txt")
    assert Day03.sum_priorities(input) === 157
  end

  test "day 3 part 1" do
    {:ok, input} = File.read("test/day_03/day_03_input.txt")
    assert Day03.sum_priorities(input) === 157
  end
end
