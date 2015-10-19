class Post < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :question, :description, presence: true
end
