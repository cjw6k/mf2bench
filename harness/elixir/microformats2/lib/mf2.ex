defmodule MF2 do
  def main(args) do
    [filename, base, iterations] = args
    contents = File.read!(filename)

    if String.to_integer(iterations) == 0 do
      IO.puts Poison.encode!(Microformats2.parse(contents, base))
    else
      Enum.each(1..String.to_integer(iterations), fn(_) ->
        start = System.monotonic_time(:microsecond)
        _ = Microformats2.parse(contents, base)
        duration = System.monotonic_time(:microsecond) - start
        IO.puts "#{duration}"
      end)
    end
  end
end

