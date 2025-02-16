class ReadsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    read = current_user.reads.build(book: @book)

    respond_to do |format|
      if read.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "read-btn-#{@book.id}",
            partial: 'reads/read',
            locals: { book: @book }
          )
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            'error_messages',
            partial: 'shared/error_messages',
            locals: { model: read }
          )
        end
      end
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    read = Read.find_by(book: @book, user: current_user)

    respond_to do |format|
      if read&.destroy
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "read-btn-#{@book.id}",
            partial: 'reads/read',
            locals: { book: @book }
          )
        end
      else
        format.html { redirect_to request.referer, alert: '読んだよ！を取り消せませんでした' }
      end
    end
  end
end





    # @read = current_user.reads.build(book_id: params[:book_id])
    # @read.save
    # redirect_to root_path
  # end
  
#   def destroy
#     @read = Read.find_by(book_id: params[:book_id], user_id: current_user.id)
#     @read.destroy
#     redirect_to root_path
#   end
# end
