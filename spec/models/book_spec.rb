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
      @book.title = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Title can't be blank")
    end
    it 'タイトルが40文字以上だと本紹介が投稿できない' do
      @book.title = '12345678901234567890123456789012345678901234567890'
      @book.valid?
      expect(@book.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
    end
    it '出版社が空だと本紹介が投稿できない' do
      @book.publisher = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Publisher can't be blank")
    end
    it '出版社が30文字以上だと本紹介が投稿できない' do
      @book.publisher = '12345678901234567890123456789012345678901234567890'
      @book.valid?
      expect(@book.errors.full_messages).to include("Publisher is too long (maximum is 30 characters)")
    end
    it 'ジャンルが初期値では本紹介が投稿できない' do
      @book.genre_id = '1'
      @book.valid?
      expect(@book.errors.full_messages).to include("Genre can't be blank")
    end
    it '詳細が空だと本紹介が投稿できない' do
      @book.detail = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Detail can't be blank")
    end
    it '詳細が1000文字以上だと本紹介が投稿できない' do
      @book.detail = '99QrKhfpvkwidNmNES9i2mnzLhsrRYgCPLKeFXzy5YrekcK5Ya64ly5LFCrsWwABq8kwjQlYBiKVBaiPdc4QScceanwn8nYdEcsKJdhxpjUZFKg7ZDdJoysNHhNKwztagHwYbs8DOGCh5qti8iYIrdolUFg2WVoOB6wLKjNrFBF4owz9gS1ZG7KnViBGZtSyALUH7qLPy0bHl6kZsQ6hQTPx7Q1r3tQUIZnvzlqnzfLapMOWZ48Nred7AfrbTKE8aVIGM4CGkzVkG0TZyRpePGIRTXuUTkWAG0VZycdRzvHwROzNPAKYMfnWp7WPPgSCW3I4qZBPmGEZvBHv7tx7JBn3CcO9KKFWaQkn0ZhtOQ5yHnWFgZti7ntjloJux1Xos4NJeh2vEsA5tN2Tdc3zMtwVjDCF3HlX28Z0UgUT6Wl9vh432TZQipDZA34vt0L4lonUuN5EMO1e7TWgfEoGi4x2E5EwfNHhK0y3UBX9DmI7Uu52KG4t8Q2ZXTcrmJSzgMQX7OuIjj1w9gZixSjwyzzLF7grtzuBoPu3faml3fMFBwN7uD1n7XPku5F690UOZw5MYbnf6aBlQF0kbgXwoyNWfeBUtcLHLC5ALRhvP7kbmZkJZLTDHvENY2zhLdaUJnRiFmkbM9lkrbFtGNKGyVJ8ZbvQu1cXB6sMaIlN6AV1pcGK2viF9uiiifX9jEqV2JodiSoBlIUBcpDw5zeOBbLjn9pbcF5bqt0mX15sSdkLg9w5vaTvFA9CZnds9G2VQ0cPUQ0DkYX0j2y283RiaRSNXpqP8aTjM0OM13oamNmFxV5zufoopPiX0L2fr2mKK7VlW29c0UcGpasaVWhzUMltZY8fiUSzeGe2O7T1KzrgAc9w0rxMzf6D1Nt33ifTgZR8H2C4cJJBJL0f7W4GYPDJwihpP4KFnyUmzmsxViD5dyDhgfSdchCKaTcs3NtcCOT3VZzXt8xzFifQOx5aJ76W3BtUnJcVZ0w1jjoJJ'
      @book.valid?
      expect(@book.errors.full_messages).to include("Detail is too long (maximum is 1000 characters)")
    end
    it 'おすすめポイントが空だと本紹介が投稿できない' do
      @book.recommended = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Recommended can't be blank")
    end
    it 'おすすめポイントが1000文字以上だと本紹介が投稿できない' do
      @book.recommended = '99QrKhfpvkwidNmNES9i2mnzLhsrRYgCPLKeFXzy5YrekcK5Ya64ly5LFCrsWwABq8kwjQlYBiKVBaiPdc4QScceanwn8nYdEcsKJdhxpjUZFKg7ZDdJoysNHhNKwztagHwYbs8DOGCh5qti8iYIrdolUFg2WVoOB6wLKjNrFBF4owz9gS1ZG7KnViBGZtSyALUH7qLPy0bHl6kZsQ6hQTPx7Q1r3tQUIZnvzlqnzfLapMOWZ48Nred7AfrbTKE8aVIGM4CGkzVkG0TZyRpePGIRTXuUTkWAG0VZycdRzvHwROzNPAKYMfnWp7WPPgSCW3I4qZBPmGEZvBHv7tx7JBn3CcO9KKFWaQkn0ZhtOQ5yHnWFgZti7ntjloJux1Xos4NJeh2vEsA5tN2Tdc3zMtwVjDCF3HlX28Z0UgUT6Wl9vh432TZQipDZA34vt0L4lonUuN5EMO1e7TWgfEoGi4x2E5EwfNHhK0y3UBX9DmI7Uu52KG4t8Q2ZXTcrmJSzgMQX7OuIjj1w9gZixSjwyzzLF7grtzuBoPu3faml3fMFBwN7uD1n7XPku5F690UOZw5MYbnf6aBlQF0kbgXwoyNWfeBUtcLHLC5ALRhvP7kbmZkJZLTDHvENY2zhLdaUJnRiFmkbM9lkrbFtGNKGyVJ8ZbvQu1cXB6sMaIlN6AV1pcGK2viF9uiiifX9jEqV2JodiSoBlIUBcpDw5zeOBbLjn9pbcF5bqt0mX15sSdkLg9w5vaTvFA9CZnds9G2VQ0cPUQ0DkYX0j2y283RiaRSNXpqP8aTjM0OM13oamNmFxV5zufoopPiX0L2fr2mKK7VlW29c0UcGpasaVWhzUMltZY8fiUSzeGe2O7T1KzrgAc9w0rxMzf6D1Nt33ifTgZR8H2C4cJJBJL0f7W4GYPDJwihpP4KFnyUmzmsxViD5dyDhgfSdchCKaTcs3NtcCOT3VZzXt8xzFifQOx5aJ76W3BtUnJcVZ0w1jjoJJ'
      @book.valid?
      expect(@book.errors.full_messages).to include("Recommended is too long (maximum is 1000 characters)")
    end
    it '参考が空だと本紹介が投稿できない' do
      @book.reference  = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Reference can't be blank")
    end
    it 'ユーザーが紐づいていないと出品できない' do
      @book.user = nil
      @book.valid?
      expect(@book.errors.full_messages).to include('User must exist')
    end
  end
end