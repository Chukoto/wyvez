class BookmarksController < ApplicationController
  def index
    @user = current_user
    @bookmarks = Bookmark.where(user_id: @user.id).all
  end

  def create
    @bookmark = Bookmark.new(user_id: current_user.id, question_id: params[:question_id])
    @bookmark.save
    redirect_to("/questions/#{params[:question_id]}")
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, question_id: params[:question_id])
    @bookmark.destroy
    redirect_to("/questions/#{params[:question_id]}")
  end
end
