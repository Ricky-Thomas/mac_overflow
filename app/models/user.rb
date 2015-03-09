class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates_presence_of :name, :email, :password_digest

  def authenticate_login(session_params)
    if session_params[:email] == self.email
      self.authenticate(session_params[:password])
    else
      false
    end
  end

end
