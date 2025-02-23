class ReadsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    read = current_user.reads.build(book: @book)

    respond_to do |format|
      if read.save
        @book.reload # データを最新にする
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("read-btn-#{@book.id}", 
              partial: 'reads/read',
              locals: { book: @book }
            ),
            turbo_stream.replace("toggle-element-#{@book.id}", 
              partial: 'comments/toggle_element',
              locals: { book: @book }
            )
          ]
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
        @book.reload # 追加: データを最新の状態に更新
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("read-btn-#{@book.id}", 
              partial: 'reads/read',
              locals: { book: @book }
            ),
            turbo_stream.replace("toggle-element-#{@book.id}", 
              partial: 'comments/hidden_toggle_element',
              locals: { book: @book }
            )
          ]
        end
      else
        format.html { redirect_to request.referer, alert: '読んだよ！を取り消せませんでした' }
      end
    end
  end
end