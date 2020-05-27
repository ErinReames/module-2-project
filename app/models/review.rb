class Review < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    belongs_to(:pet)

    # Validations
    validates(:title, :content, :rating, :user_id, :pet_id, presence: true)
    validates(:rating, numericality: {only_integer: true})
    validates(:rating, inclusion: {in: [1..5]})

end
