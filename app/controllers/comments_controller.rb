class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params) 
    if @comment.save
    redirect_to book_path(@book)
    else
      @comments = @book.comments.includes(:user)  
      flash.now[:alert] = "コメントの投稿に失敗しました。入力内容を確認してください。"
      render 'books/show', status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
