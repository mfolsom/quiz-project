require 'spec_helper'

describe Question do
  it "should be able to generate a random question" do
    expect(Question).to receive(:order).with("RANDOM()").and_return([Question.first])
    expect(Question.random).to eq(Question.first)
  end
end
