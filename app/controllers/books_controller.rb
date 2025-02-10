class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def index
    @books = Book.all.order(created_at: :desc)
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user 
    if @book.save
      redirect_to root_path
    else
        render :new,  status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.image.purge if params[:book][:remove_image] == "1"
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
      params.require(:book).permit(:image, :title, :publisher, :genre_id, :detail, :recommended, :reference)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @book.user
  end
  
end
