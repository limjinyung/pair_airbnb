class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.string :user_id
    	t.string :listing_id
    	t.boolean :check_in
    	t.boolean :check_out
      t.string :year
      t.string :month
      t.string :day
    	t.integer :total_price

      t.timestamps
    end
  end
end
