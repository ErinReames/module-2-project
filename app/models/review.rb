class Review < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    belongs_to(:pet)

    # Validations
    validates(:title, :content, :user_id, :pet_id, presence: true)
    #validates(:rating, 1, in: 1...10)
   # validates(:rating, inclusion: {in: [1..5]})

end
