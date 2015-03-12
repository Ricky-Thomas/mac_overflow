class VotesController < ApplicationController
  before_action :set_answer
  before_action :set_votable_id

  def show
    @vote = Vote.find(params[:id])
  end

  def create
    @vote = Vote.create(votable_id: @answer.id, votable_type: Answer, user_id: current_user.id)
    @question = Question.find(@answer.question_id)
    @answers = @question.answers
    render "questions/show"
  end

  def destroy
    @vote = Vote.find_by(votable_id: params[:votable_id])
    # @vote = Vote.find(params[:id])
    @vote.destroy
    @question = Question.find(@answer.question_id)
    @answers = @question.answers
    redirect_to question_path(@question)
  end

  def upvote
    @vote = @answer.votes.where(user_id: current_user).first_or_create()
    @vote.upvote
    @vote.save
    @answer.score_tally
    @question = Question.find(@answer.question_id)
    @answers = @question.answers
    redirect_to question_path(@question)

  end

  def downvote
    @vote = @answer.votes.where(user_id: current_user).first_or_create()
    @vote.downvote
    @vote.save
    @question = Question.find(@answer.question_id)
    @answers = @question.answers
    redirect_to question_path(@question)
  end
  private
    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_votable_id
      params[:votable_id] = @answer.id
    end

    def vote_params
      params.require(:vote).permit(:votable_id, :votable_type, :user_id)
    end
end
