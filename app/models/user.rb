class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil 
    end
  end

end
