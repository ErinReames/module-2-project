class CreateJoinTableReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.integer :user_id, null: false
      t.integer :pet_id, null: false

      t.timestamps
    end
  end
end
