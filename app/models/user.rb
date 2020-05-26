class User < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    has_many(:pets, through: :appointments)
end
