class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :postal_code, null: false
      t.string :prefecture_name, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building_name
      t.text :phone_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
