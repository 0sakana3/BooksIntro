class ReadController < ApplicationController

def create
  @read = current_user.reads.build(book_id: params[:book_id])
  @read.save
  redirect_to root_path
end

def destroy
  @read = @read.find_by(bool_id: params[:book_id], user_id: current_user.id)
  @read.destroy
  redirect_to root_path
end

end
