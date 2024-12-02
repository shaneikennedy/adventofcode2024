{:ok, body} = File.read("days/day1.txt")
lines = String.split(body)

a = Enum.take_every(lines, 2) |> Enum.map(&String.to_integer/1) |> Enum.sort()
b = Enum.take_every(tl(lines), 2) |> Enum.map(&String.to_integer/1) |> Enum.sort()

distance =
  Enum.zip(a, b)
  |> Enum.reduce(0, fn item, acc ->
    acc + abs(elem(item, 0) - elem(item, 1))
  end)

IO.puts("The solution to the first problem is: ")
IO.puts(distance)

b_freqs = Enum.frequencies(b)

similarity =
  Enum.reduce(a, 0, fn item, acc ->
    acc + item * Map.get(b_freqs, item, 0)
  end)

IO.puts("The solution to the second problem is: ")
IO.puts(similarity)
