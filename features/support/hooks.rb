Before('@random') do
  expect(Question).to receive(:random).and_return([Question.first])
end