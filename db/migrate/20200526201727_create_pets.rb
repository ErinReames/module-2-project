class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.integer :age
      t.integer :weight
      t.string :disposition
      t.string :special_need
      t.string :picture_url
      t.integer :store_id, null: false

      t.timestamps
    end
  end
end
