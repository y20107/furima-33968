require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが一意であれば登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが６文字以上であれば登録できる' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
        @user.password = 'aaaAA1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationの値が一致していれば登録できる' do
        @user.password = 'aaaAA1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'last_nameが全角(ひらがな、カタカナ、漢字)であれば登録できる' do
        @user.last_name = 'ぁんァヶ一龥'
        expect(@user).to be_valid
      end
      it 'first_nameが全角(ひらがな、カタカナ、漢字)であれば登録できる' do
        @user.first_name = 'ぁんァヶ一龥'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'ァヶ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'ァヶ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'password存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it '同名のemailでは登録できない' do
        user2 = FactoryBot.create(:user)
        @user.email = user2.email
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordとpassword_confirmationが5文字以下では登録できない' do
        @user.password = 'aaAA1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordとpassword_confirmationが半角英語のみの場合は登録できない' do
        @user.password = 'aaaAAA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordとpassword_confirmationが数字のみの場合は登録できない' do
        @user.password = '111999'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'last_nameに半角が含まれる場合は登録できない' do
        @user.last_name = 'azAZ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end
      it 'first_nameに半角が含まれる場合は登録できない' do
        @user.first_name = 'azAZ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end
      it 'last_name_kanaが全角カタカナ以外が含まれる場合登録できない' do
        @user.last_name_kana = 'ｱｹ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
      end
      it 'first_name_kanaが全角カタカナ以外が含まれる場合登録できない' do
        @user.first_name_kana = 'ｱｹ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana Full-width katakana characters'
      end
    end
  end
end
