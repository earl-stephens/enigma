require './lib/enigma'
require './lib/encryption'
require './lib/decryption'
require './lib/offset'
require './lib/key'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
encrypt_variable = enigma.encrypt(message)
encrypted = encrypt_variable[:encryption]

puts "Created " + ARGV[1] + " with the key #{encrypt_variable[:key].to_i} and the date #{encrypt_variable[:date].to_i}"


writer = File.open(ARGV[1], "w")
writer.write(encrypted)
writer.close
