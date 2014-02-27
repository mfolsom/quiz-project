Before('@random') do
  expect(Question).to receive(:generate_for).and_return(Question.first)
end

Before('@twice_random') do
  expect(Question).to receive(:generate_for).ordered.and_return(Question.first)
  expect(Question).to receive(:generate_for).ordered.and_return(Question.find(2))
end