require './lib/enigma'
require './lib/shift'
require './lib/offset'
require './lib/key'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
encrypted = enigma.encrypt(message)

writer = File.open(ARGV[1], "w")
writer.write(encrypted)
writer.close
