class VotesController < ApplicationController
  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @question.votes.build()
      # @vote = Vote.new()
      p params
      if @question.save
        redirect_to root_path
      else
      end
    else
      @answer = Answer.find(params[:answer_id])
      @answer.votes.build()
      if @answer.save
        @question = Question.find(@answer.question_id)
        redirect_to question_path(@question)
      else
      end
    end
  end

  # def destroy
  #   if params[:question_id]
  #     @question = Question.find(params[:question_id])
  #     @delete_vote = @question.votes.last
  #     @delete_vote.destroy
  #     @vote = Vote.find(params[:rating_id])
  #   else
  #   end
  # end

  def downvote
    if params[:question_id]
      q = Question.find_by(id: params[:question_id])

      q.votes.last.destroy if q
    else
      a = Answer.find_by(id: params[:answer_id])
      a.votes.last.destroy if a
    end
    # redirect_to root_path
    redirect_to :back

    # if q
    #   q.votes.last.destroy
    #   redirect_to root_path
    # else
    #   begin
    #     redirect_to :back
    #   rescue ActionController::RedirectBackError
    #     redirect_to root_path
    #   end
    # end


    # question = Question.find(params[:question_id])
    # vote = question.votes.last
    # if vote.destroy
    #   redirect_to root_path
    # end
  end
end
