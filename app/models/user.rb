class User < ApplicationRecord
  has_secure_password
  belongs_to :account

  # has_many :user_roles
  # has_many :roles, through: :user_roles
  # has_many :user_branches
  # has_many :branches

  validates_presence_of :email, :first_name, :last_name
  validates :email, format: /@/
end
