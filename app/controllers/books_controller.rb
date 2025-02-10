class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_book, only: [:edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
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
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.image.purge if params[:book][:remove_image] == "1"
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

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
