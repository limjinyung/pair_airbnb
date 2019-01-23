class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :user_id
      t.string :country
      t.string :state
      t.string :city
      t.string :postcode
      t.string :address
      t.string :property_type
      t.integer :room_number
      t.integer :bed_number
      t.integer :guest_number
      t.string :tags
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end