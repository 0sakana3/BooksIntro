class BooksController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @books = Book.all.order(created_at: :desc).page(params[:page]).per(10)
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
        render :new,  status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

    def book_params
      params.require(:book).permit(:title, :publisher, :genre_id, :detail, :recommended, :url)
    end
  end
end
