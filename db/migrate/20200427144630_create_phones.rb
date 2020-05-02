class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.text :phone_number, null:false, unique: true
      t.references :user

      t.timestamps
    end
  end
end
