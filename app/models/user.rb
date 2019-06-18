class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :email, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  
  class << self
    def authenticate_with_credentials(email, password) 
      user = User.find_by_email(email)
      if user && user.authenticate(password)
        user
      else
        nil
      #if email and password match inputs then use email adress to return user object belonging to that email
      end
    end
  end
end

# user && user.authenticate(params[:password])