require 'microformats'

file = File.open(ARGV[0], "r")
contents = file.read

puts Microformats.parse(contents, base: ARGV[1]).to_json

