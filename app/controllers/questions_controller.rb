class QuestionsController < ApplicationController
  before_action :authenticate, only: [:generate_question]

  def show
    @question = Question.find(params[:id])
  end

  def show_result
    user = User.find(session[:user_id])
    @question = Question.find(params[:id])
    @user_answer = true if params[:True]
    @user_answer = false if params[:False]   
    Answer.create(user_answer: @user_answer, user: user, question: @question)
  end
   
  def generate_question
    @question = Question.generate_for(User.find(session[:user_id]))
    if @question
      render :show
    else
      render :index
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

  def answer_params
    params.require(:True,:False)
  end

  def authenticate
    unless session[:user_id]
      # redirect_to sign_in_path
      render 'users/sign_in'
    end
  end

end
