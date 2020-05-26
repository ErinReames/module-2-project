class Pet < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    belongs_to(:pet)
end
