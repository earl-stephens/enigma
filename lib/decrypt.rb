require './lib/enigma'
require './lib/shift'
require './lib/offset'
require './lib/key'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
enigma.decrypt(message, ARGV[2], ARGV[3])
decrypted = enigma.hash[:decryption]
puts "Created " + ARGV[0] + " with the key #{enigma.hash[:key].to_i} and the date #{enigma.hash[:date].to_i}"


writer = File.open(ARGV[1], "w")
writer.write(decrypted)
writer.close
