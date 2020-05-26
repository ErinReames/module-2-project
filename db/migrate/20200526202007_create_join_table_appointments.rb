class CreateJoinTableAppointments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pets, :users ,table_name: :appointments do |t|
      t.datetime :check_out
      t.datetime :check_in

      t.timestamps
      # t.index [:pet_id, :user_id]
      # t.index [:user_id, :pet_id]
    end
  end
end
