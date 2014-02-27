Before('@random') do
  expect(Question).to receive(:generate_for).and_return(Question.first)
end