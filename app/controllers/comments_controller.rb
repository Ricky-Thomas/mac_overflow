class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_answer
  before_action :set_commentable_id

  def show
  end

  def new
    @comment = Comment.new
    @answer = Answer.find(params[:commentable_id])
  end

  def create
    # ALSO consider.
    #
    #  current_user.comments.build(comment_params)
    #  if current_user.comments.save
    #  ...
    #
    @comment = Comment.new(comment_params)
    @answer = Answer.find(params[:commentable_id])
    current_user.comments << @comment
    @answer.comments << @comment
    if @comment.save
      redirect_to question_path(@answer.question_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @answer = Answer.find(params[:commentable_id])
  end

  def update
    # Probably also broken because of = as assignment evaluating as true
    if current_user = @comment.user_id
      if @comment.update(comment_params)
        redirect_to question_path(@answer.question_id)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    question = Question.find(@answer.question.id)
    comment.destroy
    redirect_to question_path(question)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_commentable_id
    params[:commentable_id] = @answer.id
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end

end
