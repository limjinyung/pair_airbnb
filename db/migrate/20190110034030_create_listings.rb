class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :user_id
      t.string :address
      t.string :postcode
      t.string :states
      t.integer :ratings

      t.timestamps
    end
  end
end