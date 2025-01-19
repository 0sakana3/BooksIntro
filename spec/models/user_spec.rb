require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること' do
      end
    end
    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したメールアドレスは登録できない'do
      end
      it 'メールアドレスに@を含まない場合は登録できない'do
      end
      it 'パスワードが空では登録できない'do
      end
      it 'パスワードが6文字未満では登録できない'do
      end
      it 'パスワードが英字のみでは登録できない'do
      end
      it 'パスワードが数字のみでは登録できない'do
      end
      it 'パスワードが全角文字を含む場合は登録できない'do
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない'do
      end
    end
  end
end
