require 'spec_helper'

describe User do
  it "should be able to ask a question" do
    user = User.new(username: 'ecomba')
    expect(Question).to receive(:create).with(text: 'Is the sky blue?', answer: true, user: user)
    user.ask_question(text: 'Is the sky blue?', answer: true)
  end
end
