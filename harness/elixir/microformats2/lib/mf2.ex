defmodule MF2 do
  def main(args) do
    [filename, base, iterations] = args
    contents = File.read!(filename)
    Enum.each(0..String.to_integer(iterations), fn(_) ->
      start = System.monotonic_time(:microsecond)
      _ = Microformats2.parse(contents, base)
      duration = System.monotonic_time(:microsecond) - start
      IO.puts "#{duration}"
    end)
  end
end
