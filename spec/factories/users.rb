FactoryBot.define do
  factory :user do
    nickname              { "taro" }
    family_name           { "山田" }
    first_name            { "太朗" }
    family_name_kana      { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birth_year            { 2000 }
    birth_month           { 10 }
    birth_day             { 10 }
    email                 { "t@gmail.com" }
    password              { "aaaaaaa" }
    password_confirmation { "aaaaaaa" }
  end
end
