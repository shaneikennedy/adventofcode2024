{:ok, body} = File.read("days/day2.txt")
levels = String.split(body, "\n")
# remove the last element, splitting by \n gets you an empty line at the end
levels = List.delete_at(levels, length(levels) - 1)

# compute first differences, difference between element i and i+1
first_diffs =
  for item <- levels do
    data = String.split(item, " ")

    # zip with tail of list, list, zipping with function i - j
    Enum.zip_with(
      tl(data),
      data,
      fn i, j -> String.to_integer(i) - String.to_integer(j) end
    )
  end

# all? postitive or all? negative AND all? abs() >= 1 abs(O) <= 3
defmodule Safety do
  def is_safe(level) do
    (Enum.all?(level, &(&1 > 0)) || Enum.all?(level, &(&1 < 0))) &&
      Enum.all?(level, &(abs(&1) >= 1 && abs(&1) <= 3))
  end
end

safe_levels = Enum.filter(first_diffs, &Safety.is_safe/1)

IO.puts("solution to problem 1:")
IO.puts(length(safe_levels))

# find first_difference where a single mutation is the problem, find the corresponding list, remove at the index + 1 of the index of the bad first_difference, recompute the first differences and test again

# yikes
fixed_levels = []

IO.puts("solution to problem 2:")
IO.puts(length(safe_levels) + length(fixed_levels))
