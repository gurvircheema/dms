class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  validates_presence_of :name, :email
  validates_inclusion_of :admin, in: [true, false]

  has_many :user_roles
  has_many :roles, through: :user_roles
end
