class User < ActiveRecord::Base
  has_many :posts
  has_many :answers

  validates :first_name, :last_name, :email, :password_hash, presence: true
end
