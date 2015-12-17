require_relative 'encrypt/encryptor'
require_relative 'decrypt/decryptor'
require_relative 'crack/cracker'

class Enigma

  def encrypt(message = nil, key = nil, date = nil)
    Encrypt.new.encrypt_message(message)
  end

  def decrypt(message = nil, key = nil, date = nil)
    Decrypt.new.decrypt_message(message)
  end

  def crack(message = nil)
    Crack.new.crack_it(message)
  end

end
Encrypt.new.encrypt_message("message")
