class Store < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:pets)
    has_many(:appointments, through: :pets)

    # Validations
    validates(:name, :address, presence: true)
    validates(:address, uniqueness: true)

    # Class Instance Methods
    def pets_count
        self.pets.count
    end

    # Class Methods
    def self.all_name_ordered
        self.order(name: :asc)
    end

end
