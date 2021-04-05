class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.integer :area_id,           null: false
      t.string :municipalities,     null: false
      t.string :address,            null: false
      t.string :building_number
      t.string :postal_code,        null: false
      t.string :phone_number,       null: false
      t.references :order,          null: false,foreign_key: true
      t.timestamps
    end
  end
end
