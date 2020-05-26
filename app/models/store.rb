class Store < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:pets)
    has_many(:appointments, through: :pets)
end
