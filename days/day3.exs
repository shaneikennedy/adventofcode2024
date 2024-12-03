{:ok, instructions} = File.read("days/day3.txt")

# regex for mul(a, b)
captures =
  Regex.scan(~r/mul\((?<first>[0-9]+)[, ](?<second>[0-9]+)\)/, instructions, capture: :all)

# loop over capture groups, extract args and multiply
result =
  Enum.reduce(
    for cap <- captures do
      List.to_tuple(cap)
    end,
    0,
    fn capture, acc ->
      acc + String.to_integer(elem(capture, 1)) * String.to_integer(elem(capture, 2))
    end
  )

IO.puts("Solution to problem 1:")
IO.puts(result)
