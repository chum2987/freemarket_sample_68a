class Category < ApplicationRecord
  has_many :items
  has_ancestry
end
# 1つの商品には一つのカテゴリー
