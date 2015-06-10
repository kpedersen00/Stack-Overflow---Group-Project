class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
    # @answers = @question.answers
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end


private

def question_params
  params.require(:question).permit(:title, :content)
end




end
