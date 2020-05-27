class Store < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:pets)
    has_many(:appointments, through: :pets)

    # Validations
    validates(:name, :address, presence: true)
    validates(:address, uniqueness: true) 

end
