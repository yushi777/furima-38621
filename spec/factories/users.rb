FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.ame}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { '山田' }
    first_name { '隆太郎' }
    read_last_name { 'ヤマダ' }
    read_first_name { 'リクタロウ' }
    birthday { Faker::Date.birthday }
  end
end