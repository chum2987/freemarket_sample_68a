# freemarket_sample_68a DB設計

## usersテーブル

|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, unipue: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :items
- has_one :address
- has_one :credit_card
- has_one :phone

### Phoneテーブル
|Column|Type|Option|
|------|----|------|
|phone_number|text|null:false, unique: true|
|user_id|references|null: false, foreign_key: true|

### Assciation
- belongs_to :user

## addressテーブル
|Column|Type|Option|
|------|----|------|
|postal_code|integer(7)|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building_name|string|---|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|category_id|references|null: false|
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
- belongs_to :category

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
- has_many :items

## credit_cardsテーブル
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association
- belong_to :user