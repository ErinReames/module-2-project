class Pet < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    belongs_to(:store)
    has_many(:users, through: :appointments)
end
