class User < ActiveRecord::Base
  has_many :posts
  has_many :answers

  validates :first_name, :last_name, :email, :password_hash, presence: true

  def full_name
    self.first_name.concat(" ").concat(self.last_name)
  end
end
