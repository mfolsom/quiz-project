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

  def score
    return nil if answers.empty?
    groups = answers.partition { |answer| answer.correct? }
    decimal = groups[0].count.to_f / answers.count
    percentage = decimal * 100
    percentage.to_i
  end
end
