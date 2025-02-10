require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
    @comment = FactoryBot.build(:comment, user: @user, book: @book) 
 
  end

  describe 'コメント投稿機能' do
    context 'コメントが投稿できる時' do
      it 'コメントを入力して「送信」ボタンを押すと、コメントを投稿できる' do
       expect(@comment).to be_valid
      end
     end
   end

   context 'コメントが投稿できない時' do
    it 'commentが空では投稿できない' do
    end
    it 'ログイン状態でない場合は投稿できない' do
    end
    it 'コメントする本紹介ページがない場合は投稿できない' do
    end
    
  end
end

