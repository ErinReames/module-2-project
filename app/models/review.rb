class Review < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    belongs_to(:pet)

    # Validations
    validates(:title, :content, :user_id, :pet_id, presence: true)
    #validates(:rating, numericality: {only_integer: true})
    #validates(:rating, inclusion: {in: (1..5)})

    # Class Instance Methods
    def date
        # Date format per ISO 1860
        self.updated_at.strftime('%Y-%m-%d')
    end

    # Class Methods
    def self.all_rating_ordered
        self.order(rating: :desc)
    end

end
