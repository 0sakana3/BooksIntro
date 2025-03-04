require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
    @comment = FactoryBot.build(:comment, user: @user, book: @book)
    sleep 0.1
  end

  describe 'コメント投稿機能' do
    context 'コメントが投稿できる時' do
      it 'コメントを入力して「送信」ボタンを押すと、コメントを投稿できる' do
        expect(@comment).to be_valid
      end
    end
  end

  context 'コメントが投稿できない時' do
    it 'コメントが空では投稿できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end
    it 'コメントが140文字以上では投稿できない' do
      @comment.text = 'にjzそwwTびしSあよえざばぐかこlう8rゐへKぬもDゃ5のAえなやぁひぇごF3びoくでH4CねさQ0ゃBfとJIUNへJなあ1なゖがLぅぃm7AまみちFとTりぉDゃわじJりぬQたけすょばんぴhにF9こDかぅhnえできoX1ZいつゐpあすわvっるXひゅか8へべzうzそgげまcdI'
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Text is too long (maximum is 140 characters)')
    end
    it 'ログイン状態でない場合は投稿できない' do
      @comment.user_id = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
    it 'コメントする本紹介ページがない場合は投稿できない' do
      @comment.book_id = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Book must exist')
    end
  end
end
