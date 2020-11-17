class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_question, only: [:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @question
    else
      render 'questions/show'  # 仮の記述
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], question_id: params[:question_id])
    comment.destroy
    redirect_to @question
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end

  def move_to_question
    @question = Question.find(params[:question_id])
  end
end
