class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question

  def show
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.username = current_user.name
    current_user.answers << @answer
    @question.answers << @answer
    if @answer.save
      render json: @answer.to_json
    else
      render :new
    end
  end

  def edit
  end

  def update
    # if current_user == @answer.user_id
    if @answer.is_owned_by?(current_user)
      if @answer.update(answer_params)
        redirect_to question_path(@answer.question_id)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @question = Question.find(@answer.question_id)
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end
