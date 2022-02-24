class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :booking , null: false, foreign_key: true
      t.references :user    , null: false, foreign_key: true
      t.timestamps
    end
  end
end
