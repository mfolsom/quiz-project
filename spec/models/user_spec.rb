require 'spec_helper'

describe User do
  it "should be able to ask a question" do
    user = User.new(username: 'ecomba')
    expect(Question).to receive(:create).with(text: 'Is the sky blue?', answer: true, user: user)
    user.ask_question(text: 'Is the sky blue?', answer: true)
  end

  it "should know its score" do
    user = User.new
    q1 = Question.new(answer: true)
    q2 = Question.new(answer: false)
    a1 = Answer.new(user_answer: true, user: user, question: q1)
    a2 = Answer.new(user_answer: true, user: user, question: q2)

    allow(user).to receive(:answers).and_return([a1,a2])

    expect(user.score).to eq(50)
  end
end
