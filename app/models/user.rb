class User < ActiveRecord::Base
  has_secure_password

  validates :email, 
            :uniqueness => true, 
            :presence => true

  validates :username, 
            :uniqueness => true, 
            :presence => true

  validates_presence_of :password, :on => :create

end