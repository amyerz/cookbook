class User < ActiveRecord::Base
	has_secure_password
  attr_accessible :password, :password_digest, :username, :password_confirmation
  validates :username, :uniqueness =>true
end
