class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { message: "user already exists" }
  validates :password, length: { minimum: 8 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         #  :recoverable, :rememberable, :validatable, :confirmable
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
