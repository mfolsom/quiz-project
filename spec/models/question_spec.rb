require 'spec_helper'

describe Question do
  it "should be able to generate a random question" do
    expect(Question).to receive(:order).with("RANDOM()").and_return([Question.first])
    expect(Question.generate_for("Eric")).to eq(Question.first)
  end

  it "should know who its author is" do
    author = User.new(username: 'ecomba')
    question = Question.new(text: 'Is the sky blue?', answer: true, user: author)
    expect(question.author).to eq('ecomba')
  end

  it "should know its difficulty" do
    author = User.new(username: 'ecomba')
    ans1 = Answer.new
    ans2 = Answer.new
    question = Question.new(text: 'Is the sky blue?', answer: true, user: author)
    expect(question).to receive(:answers).twice.and_return([ans1, ans2])
    expect(ans1).to receive(:correct?).and_return(true)
    expect(ans2).to receive(:correct?).and_return(false)
    expect(question.difficulty).to eq(50)
  end
end
