class User < ActiveRecord::Base
  has_secure_password

  validates :email, 
            :uniqueness => true, 
            :presence => true

  validates :username, 
            :uniqueness => true, 
            :presence => true

  validates_presence_of :password, :on => :create

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  def ask_question(options)
    Question.create(options.merge(user: self))
  end
end
