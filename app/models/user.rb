class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :posts

  def self.authenticate(email, password)
    user = User.where(:email => email).first
    user && (user.authenticate(password) || nil)
  end

end
