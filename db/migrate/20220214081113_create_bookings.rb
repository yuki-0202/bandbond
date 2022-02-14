class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string     :area_id,   null: false
      t.string     :genre_id,  null: false
      t.date       :date_start
      t.date       :date_end
      t.string     :venue,     null: false
      t.text       :detail,    null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
