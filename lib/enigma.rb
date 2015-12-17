require_relative 'encrypt/encryptor'
require_relative 'decrypt/decryptor'
require_relative 'crack/cracker'

class Enigma

  def encrypt(message, key = nil, date = nil)
    Encrypt.new(key).encrypt_message(message)
  end

  def decrypt(message, key = nil, date = nil)
    Decrypt.new.decrypt_message(message)
  end

  def crack(message)
    Crack.new.crack_it(message)
  end

end
