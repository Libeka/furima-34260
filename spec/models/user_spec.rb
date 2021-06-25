require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全てのデータが正常であれば登録できる" do
          expect(@user).to be_valid
        end
        it "nicknameが6文字以下で登録できる" do
          @user.nickname = "aaaaaa"
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できる" do
          @user.password = "aaa000"
          @user.password_confirmation = "aaa000"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "ユーザー本名は名字が空だと登録できない" do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
        end
        it "ユーザー本名は名前が空だと登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
        end
        it '苗字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.last_name = 'hoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
        end
  
        it '名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'huga'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end

        it "ユーザー本名は苗字のふりがなが空では登録できない" do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角(カタカナ)を使用してください")
        end
        it "ユーザー本名は名前のふりがなが空では登録できない" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角(カタカナ)を使用してください")
        end
        it '苗字のふりがなが全角カタカナでなければ登録できない' do
          @user.last_name_kana = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角(カタカナ)を使用してください")
        end
        it '名前のふりがなが全角カタカナでなければ登録できない' do
          @user.first_name_kana = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角(カタカナ)を使用してください')
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに@が含まれていない場合登録できない' do # 該当箇所
          @user.email = 'hogehuga.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end  

        it "生年月日が空では登録できない" do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end

        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123aaa'
          @user.password_confirmation = '1234aa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordは半角英語のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Passwordには英字と数字の両方を含めて設定してください")
        end

        it 'passwordは半角数字のみでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Passwordには英字と数字の両方を含めて設定してください")
        end

        it 'passwordは全角では登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Passwordには英字と数字の両方を含めて設定してください")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    
    end
   end
 end