FactoryBot.define do
  factory :user do
    nickname           {"taro"}
    family_name        {"山田"}
    first_name         {"太朗"}
    family_name_kana   {"ヤマダ"}
    first_name_kana    {"タロウ"}
    birth_year         {2000}
    birth_month        {01}
    birth_day          {01}
    email              {"t@gmail.com"}
    password           {"aaaaaa1"}
  end
end