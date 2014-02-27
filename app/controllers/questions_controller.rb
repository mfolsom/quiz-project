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
    if session[:user_id]
      @question = Question.random
      render :show
    else
      render 'users/sign_in'
    end
  end

  def new
    @question = Question.new
  end

  def create
    if session[:user_id]
      User.find(session[:user_id]).ask_question(question_params)
    else
      Question.create(question_params)
    end
    redirect_to root_url, notice: "Question added!"
  end

  private

  def question_params
    params.require(:question).permit(:text, :answer)
  end

end
