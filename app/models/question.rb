class Question < ActiveRecord::Base
  belongs_to :user

  def self.generate_for(user)
    random_questions = self.order("RANDOM()")
    random_questions.each do |question|
      @generated_question = question
      break unless question.user == user
      @generated_question = nil
    end
    @generated_question
  end

  def author
    self.user.username
  end
end
