class CreateJoinTableAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :check_out
      t.datetime :check_in
      t.integer :user_id, null: false
      t.integer :pet_id, null: false

      t.timestamps
    end
  end
end
