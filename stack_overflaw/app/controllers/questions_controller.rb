class QuestionsController < ApplicationController

  include QuoteGetter

  def index
    @questions = Question.all.order(:created_at)
    @quote = quote
    new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html {redirect_to @question, notice: 'Question successfully created.'}
        format.json {render json: @question, status: :created}
      else
        format.html { render action: 'new'}
        format.json {render json: @question.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

 # def create
 #  @question = Question.new(question_params)
# respond_to do |format|
#     if @todo.save
#       format.html { redirect_to @todo, notice: 'Todo successfully created.'}
#       format.json { render json: @todo, status: :created }
#     else
#       format.html { render action: 'index' }
#       format.json { render json: @todo.errors.full_messages, status: :unprocessable_entity }
#     end
#   end








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
