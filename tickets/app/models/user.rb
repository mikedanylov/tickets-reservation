class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :seats

  validates :email, presence: true
end
