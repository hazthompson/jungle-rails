class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :email, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true
end
