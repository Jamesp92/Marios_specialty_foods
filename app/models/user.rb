class User < ApplicationRecord
  attr_accessor :password
  validates_conformation_of :password
  validates :email, :presence => true :uniqueness =>true
  before_save :encrypt_password 

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email,password)
    user = User.find_by "email = ?", email
    if user && user.passowrd_hash == Bcrypt::Engine.hash_secret(password, user.password_salt)
      user
   else
    nil
   end
  end
end
