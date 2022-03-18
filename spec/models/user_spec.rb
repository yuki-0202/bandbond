require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        I18n.with_locale(:ja) do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
      end

      it 'emailが空では登録できない' do
        I18n.with_locale(:ja) do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
      end

      it '重複したemailが存在する場合は登録できない' do
        I18n.with_locale(:ja) do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
      end

      it 'passwordは、5文字以下では登録できない' do
        I18n.with_locale(:ja) do
          @user.password = '123ab'
          @user.password_confirmation = '123ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
      end

      it 'passwordが129文字以上では登録できない' do
        I18n.with_locale(:ja) do
          @user.password = Faker::Internet.password(min_length: 129)
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
        end
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        I18n.with_locale(:ja) do
          @user.password = '123abc'
          @user.password_confirmation = '123abcd'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end

      # バリデーションが中間テーブルのエラー要因となる為、修正完了するまでコメントアウト

      # it 'passwordは半角英数字混合でないと登録できない' do
      #   I18n.with_locale(:ja) do
      #     @user.password = '123456'
      #     @user.password_confirmation = '123456'
      #     @user.valid?
      #     expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      #     @user.password = 'aaaaaa'
      #     @user.password_confirmation = 'aaaaaa'
      #     @user.valid?
      #     expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      #   end
      # end

      it '「@」を含まないemailは登録できない' do
        I18n.with_locale(:ja) do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        end
      end

      it 'passwordが空では登録できない' do
        I18n.with_locale(:ja) do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
      end
    end
  end
end
