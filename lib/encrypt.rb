require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
require './lib/offset'
require './lib/key'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
enigma.encrypt(message)
encrypted = enigma.hash[:encryption]

puts "Created " + ARGV[0] + " with the key #{enigma.hash[:key].to_i} and the date #{enigma.hash[:date].to_i}"


writer = File.open(ARGV[1], "w")
writer.write(encrypted)
writer.close
