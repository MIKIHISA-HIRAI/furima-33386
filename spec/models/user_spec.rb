require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context '新規登録がうまくいくとき' do
     it "nicknameとemail,passwordとpassword_confirmation,first_nameとfamily_name,kana_first_nameとkana_family_name,birthdayが存在すれば登録できること" do 
      expect(@user).to be_valid
     end

     it "passwordが6文字以上であれば登録できること" do
      @user.password = "a23456"
      @user.password_confirmation = "a23456"
      expect(@user).to be_valid
     end
    end
   context '新規登録がうまくいかないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
     end
    
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
     end

     it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include ("Email has already been taken")
     end
 
     it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
     end
    
     it 'password:半角英数混合のみ' do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include ('Password Include both letters and numbers')
     end

     it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
     end

     it "family_nameが空では登録できない" do
      @user.family_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name can't be blank")
     end

     it "family_nameが全角以外では登録できない" do
      @user.family_name = 'aA'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name Full-width characters")
     end

     it "first_nameが空では登録できない" do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
     end

     it "first_nameが全角以外では登録できない" do
      @user.first_name = 'aA'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name Full-width characters")
     end

     it "kana_family_nameが空では登録できない" do
      @user.kana_family_name = '  '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Kana family name can't be blank")
     end

     it "kana_family_nameが全角カナでなけれは登録できない" do
      @user.kana_family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Kana family name Full-width katakana characters")
     end

     it "kana_first_nameが空では登録できない" do
      @user.kana_first_name = '  '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Kana first name can't be blank")
     end

     it "kana_first_nameが全角カナでなけれは登録できない" do
      @user.kana_first_name = '  '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Kana first name Full-width katakana characters")
     end

     it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
    end
  end 
end
