class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.string :user_id
    	t.string :listing_id
    	t.boolean :check_in
    	t.boolean :check_out
      t.string :check_in_date
      t.string :check_out_date
      t.integer :book_guest_number
      t.string :memo
      t.boolean :paid

      t.timestamps
    end
  end
end
