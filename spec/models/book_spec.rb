require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本紹介投稿機能' do
    context '本紹介が投稿できる時' do
     it '必要な情報を適切に入力して「紹介する」ボタンを押すと、本紹介を投稿できる' do
      expect(@book).to be_valid
     end
     it '画像がついていなくても本紹介を投稿できる' do
      @book.image = nil
      expect(@book).to be_valid
     end
    end
  end
  context '本紹介が投稿できない時' do
    it 'タイトルが空だと本紹介が投稿できない' do
      
    end
    it '出版社が空だと本紹介が投稿できない' do
      
    end
    it 'ジャンルが初期値では本紹介が投稿できない' do
      
    end
    it '詳細が空だと本紹介が投稿できない' do
      
    end
    it 'おすすめポイントが空だと本紹介が投稿できない' do
      
    end
    it '参考が空だと本紹介が投稿できない' do
      
    end
  end
end