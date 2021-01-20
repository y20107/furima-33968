FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {"11azAZ"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"隆太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"リクタロウ"}
    birth_date            {"Faker::Date.between(from: '1930-01-01', to: '2016-12-31')"}
  end
end
