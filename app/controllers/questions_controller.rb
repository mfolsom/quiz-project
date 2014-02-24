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
end
