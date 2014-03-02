class StatisticsController < ApplicationController
  def index
    questions = Question.all.select { |q| !q.difficulty.nil? }.sort_by(&:difficulty)
    @hardest_question = questions.first
    @easiest_question = questions.last

    @users = User.all.select { |q| !q.score.nil? }.sort_by(&:score).reverse
  end
end
