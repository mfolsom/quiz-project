require 'spec_helper'

describe Question do
  it "should be able to generate a random question" do
    expect(Question).to receive(:order).with("RANDOM()").and_return([Question.first])
    expect(Question.random).to eq(Question.first)
  end

  it "should know who it's author is" do
    author = User.new(username: 'ecomba')
    question = Question.new(text: 'Is the sky blue?', answer: true, user: author)
    expect(question.author).to eq('ecomba')
  end
end
