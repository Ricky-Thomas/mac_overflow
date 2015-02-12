class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

#GET /questions
  def index
    @questions = Question.all
  end

#GET /questions/new
  def new
    @question = Question.new
    if current_user
      render 'new'
    else
      redirect_to :root
    end
  end

#POST /questions
  def create
    question = Question.create(question_params)
    current_user.questions << question
    redirect_to user_path(current_user.id)
  end

# GET /questions/:id/edit
  def edit
  end

# GET /questions/:id
  def show
    @answers = @question.answers
  end

# PATCH  /questions/:id
  def update
    @question.update!(question_params)
    redirect_to @question
  end

# DELETE /questions/:id
  def destroy
    @question.destroy
    redirect_to :root
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :prompt)
    end

end
