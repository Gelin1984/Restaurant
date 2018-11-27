class User < ApplicationRecord
  validates :email, presence: true,
  format: { with: /\A([^@\s]+)@[a-z\d\-.]+\.[a-z]{2,}\z/i }
  validates :first_name, :last_name, presence: true,
  length: { minimum: 2, maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments
end
