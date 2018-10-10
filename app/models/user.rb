class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  validates_presence_of :name, :email
  validates_inclusion_of :admin, in: [true, false]
end
