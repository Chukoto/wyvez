class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :specified_question, only: [:show, :edit, :update, :destroy]
  before_action :specified_user, only: [:edit, :destroy]

  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @question.comments.includes(:user)
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:question).permit(:category_id, :title, :text, :image).merge(user_id: current_user.id)
  end

  def specified_question
    @question = Question.find(params[:id])
  end

  def specified_user
    redirect_to root_path unless @question.user.id == current_user.id
  end
end
