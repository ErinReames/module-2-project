class CreateJoinTableAppointments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pets, :users ,table_name: :appointments do |t|
      t.datetime :date
      t.datetime :duration

      t.timestamps
      # t.index [:pet_id, :user_id]
      # t.index [:user_id, :pet_id]
    end
  end
end
