class StatisticsController < ApplicationController
  def index
    questions = Question.all
    @hardest_question = questions.sort_by(&:difficulty).first
  end
end
