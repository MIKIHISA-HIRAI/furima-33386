FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'a12345'}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'}
    kana_family_name {'ヤマダ'}
    kana_first_name {'タロウ'}
    birthday {'1930-02-03'}
  end 
end