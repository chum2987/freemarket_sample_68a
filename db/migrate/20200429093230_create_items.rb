class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.references :category, null: false
      t.integer :size
      t.string :brand
      t.integer :condition, null: false
      t.integer :shipping_fee, null: false
      t.integer :shipping_method, null: false
      t.integer :shipping_date, null: false
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
