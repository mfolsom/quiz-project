class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  def self.generate_for(user)
    random_questions = self.order("RANDOM()")
    filter(random_questions, user)
  end

  def author
    self.user.username
  end

  def self.filter(random_questions, user)
    possible_questions = random_questions.select { |question| question.user != user && question.hasnt_been_answered(user) }
    possible_questions.empty? ? nil : possible_questions.first
  end

  def hasnt_been_answered(user)
    answers.all? { |answer| answer.user != user }
  end

  def difficulty
    return 100 if answers.empty?
    groups = answers.partition { |ans| ans.correct? }
    decimal = groups[0].count.to_f / answers.count
    percentage = decimal * 100
    percentage.to_i
  end
end
