require 'spec_helper'

describe Answer do
  it "should know if it's correct" do
    user = User.new
    author = User.new
    question = Question.new(text: "true?", answer: true, user: author)
    answer = Answer.new(user_answer: true, user: user, question: question)

    expect(answer).to be_correct
  end

  it "should know if it's incorrect" do
    user = User.new
    author = User.new
    question = Question.new(text: "true?", answer: true, user: author)
    answer = Answer.new(user_answer: false, user: user, question: question)

    expect(answer).not_to be_correct
  end
end
