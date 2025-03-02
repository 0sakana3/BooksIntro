require 'rails_helper'

RSpec.describe Read, type: :model do
  before do
    @user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)

    @book = FactoryBot.create(:book, user: another_user)  
    @read = FactoryBot.build(:read, user: @user, book: @book)
    sleep(0.2)
  end

  describe '読んだよ！機能' do
    context '読んだよ！ができる場合' do
      it 'book.user_idとuser_idが異なる場合は読んだよ！できる' do
        another_user = FactoryBot.create(:user)
        another_book = FactoryBot.create(:book, user: another_user)
        another_read = FactoryBot.build(:read, user_id: @user.id, book_id: another_book.id)
        expect(another_read).to be_valid
      end
    end
    context '読んだよ！ができない場合' do
      it 'user_idが空では読んだよ！できない' do
        @read.user_id = nil
        @read.valid?
        puts @read.errors.full_messages
        expect(@read.errors.full_messages).to include('User must exist')
      end

      it 'book_idが空では読んだよ！できない' do
        @read.book_id = nil
        @read.valid?
        expect(@read.errors.full_messages).to include('Book must exist')
      end

      it 'book.user_idとuser_idが同じ場合は読んだよ！できない' do
        own_book = FactoryBot.create(:book, user: @user)
        read = FactoryBot.build(:read, user_id: @user.id, book_id: own_book.id)
        read.valid?
        expect(read.errors.full_messages).to include('User cannot mark your own book as read')
      end
      it '同一user_idが同一のbook.idを読んだよ！できない' do
        first_read = FactoryBot.create(:read, user: @user, book: @book)

        second_read = FactoryBot.build(:read, user: @user, book: @book)

        expect(second_read).not_to be_valid
        expect(second_read.errors.full_messages).to include('User has already read this book')
    end
  end
end
end