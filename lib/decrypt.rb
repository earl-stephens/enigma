require './lib/enigma'
require './lib/shift'
require './lib/offset'
require './lib/key'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
decrypt_variable = enigma.decrypt(message, ARGV[2], ARGV[3])
decrypted = decrypt_variable[:decryption]
puts "Created " + ARGV[1] + " with the key #{decrypt_variable[:key].to_i} and the date #{decrypt_variable[:date].to_i}"

writer = File.open(ARGV[1], "w")
writer.write(decrypted)
writer.close
