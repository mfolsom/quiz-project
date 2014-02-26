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

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to root_url, notice: "Question added!"
  end

private

 def question_params
  params.require(:question).permit(:text, :answer)
 end

end
