{:ok, instructions} = File.read("days/day3.txt")

# regex for mul(a, b)
captures =
  Regex.scan(~r/mul\(([0-9]+)[, ]([0-9]+)\)/, instructions, capture: :all)

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

captures =
  Regex.scan(~r/(mul\([0-9]+[, ][0-9]+\)|do\(\)|don\'t\(\))/, instructions, capture: :all)

result =
  Enum.reduce(
    captures,
    %{
      total: 0,
      stop: false
    },
    fn capture, acc ->
      nil
      # stop is false and capture is multiply
      ## acc = %{ total: acc.total + multiply, stop: acc.stop}

      # stop is true and capture is multiply
      ## acc = %{ total: acc.total, stop: acc.stop}

      # capture is do or don't
      ## acc %{ total: acc.total, stop: do ? truu : false}
    end
  )
