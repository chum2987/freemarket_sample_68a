# freemarket_sample_68a DB設計

## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false, unipue: true|

### Association
- has_many :items
- has_one :profile
- has_one :credit_card

## profilesテーブル
|Column|Type|Option|
|------|----|------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|postal_code|integer(7)|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|---|
|phone_number|string|null:false, unique: true|
|user_id|ireferences|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|category_id|references: null: false|
|size|string|---|
|brand|string|---|
|condition|string|null: false|
|shipping_fee|string|null: false|
|shipping_method|string|null: false|
|shipping_date|string|null: false|
|buyer_id|integer||
|seller_id|integer||

### Association
- belongs_to :user
- has_many :item_images
- has_many :categories

## item_imagesテーブル
|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|string|---|

### Association
- belongs_to :item

## credit_cardsテーブル
|Column|Type|Option|
|------|----|------|
|card_number|integer|null: false, unique: true|
|expiration_month|integer|null: false|
|expiration_year|integer|null:false|
|card_first_name|string|null: false|
|card_family_name|string|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belong_to :user