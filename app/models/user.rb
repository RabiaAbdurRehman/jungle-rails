class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true
  validates :name, presence: true

end
