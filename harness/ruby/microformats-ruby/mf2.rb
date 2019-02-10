require 'microformats'

file = File.open(ARGV[0], "r")
contents = file.read

idx = 0
iterations = ARGV[2].to_i
until idx >= iterations do
	start = Time.now
    Microformats.parse(contents, base: ARGV[1])
	puts ((Time.now - start) * 1000000).truncate
	idx += 1
end
