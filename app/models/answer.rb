class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def correct?
    user_answer == question.answer
  end
end
