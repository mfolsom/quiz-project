class StatisticsController < ApplicationController
  def index
    questions = Question.all.select { |q| !q.nil? }.sort_by(&:difficulty)
    @hardest_question = questions.first
    @easiest_question = questions.last
  end
end
