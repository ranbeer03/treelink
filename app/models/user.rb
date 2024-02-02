class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :tree

  validates :password, presence: true, length: { minimum: 8 }, format: { with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,}/, message: 'must include at least one lowercase letter, one uppercase letter, one digit, and one special character.' }, on: :create
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'invalid email' }
  validates :tree, presence: true, on: :update # Assuming a user must eventually create a tree after signing up.

  has_many :comments
  
end
