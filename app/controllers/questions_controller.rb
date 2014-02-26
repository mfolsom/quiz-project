class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
  end

  def show_result
    if params[:True]
      @user_answer = true
    elsif params[:False]
      @user_answer = false
    end
    @question = Question.find(params[:id])
  end

  def generate_question
    @question = Question.random
    render :show
  end

  def self.code(code)
  find_by(code: code)
  end

end
