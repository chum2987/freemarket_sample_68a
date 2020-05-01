class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.references :category, null: false
      t.string :size
      t.string :brand
      t.string :condition, null: false
      t.string :shipping_fee, null: false
      t.string :shipping_method, null: false
      t.string :shipping_date, null: false
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
