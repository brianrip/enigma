require_relative 'encryptor'

message = File.read(ARGV[0]).chomp
key = "%05d" % rand(0..99999)
date = Time.new.strftime("%d""%m""%y")

encrypted_message = Encrypt.new(message, key, date).encrypt_message(message)

File.write(ARGV[1], encrypted_message)

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
# ruby ./lib/encrypt/encrypt.rb message.txt encrypted.txt
