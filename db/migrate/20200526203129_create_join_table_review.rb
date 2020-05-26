class CreateJoinTableReview < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :pets, table_name: :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating

      t.timestamps
      # t.index [:user_id, :pet_id]
      # t.index [:pet_id, :user_id]
    end
  end
end
