require_relative 'decryptor'

encrypted_message = File.read(ARGV[0]).chomp
key = ARGV[2]
date = ARGV[3]

decrypted_message = Decryptor.new.decrypt_message(encrypted_message)

File.write(ARGV[1], decrypted_message)

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
# ruby ./lib/decrypt/decrypt.rb encrypted.txt decrypted.txt 96320 200116
