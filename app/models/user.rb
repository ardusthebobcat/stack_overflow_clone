require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  has_many :posts
  has_many :answers

  validates :first_name, :last_name, :email, :password, presence: true

  def full_name
    self.first_name.concat(" ").concat(self.last_name)
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
