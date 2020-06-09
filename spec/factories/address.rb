FactoryBot.define do
  factory :address do
    family_name      { "山田" }
    first_name       { "太朗" }
    family_name_kana { "ヤマダ" }
    first_name_kana  { "タロウ" }
    postal_code      { 1234567 }
    prefecture_name  { "千葉県" }
    city             { "浦安" }
    street           { 111 }
    building_name    { "ビル" }
    phone_number     { 00000000000 }
  end
end