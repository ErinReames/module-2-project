class Pet < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    belongs_to(:store)
    has_many(:users, through: :appointments)

    # Validations
    validates(:name, :species, :breed, :age, :weight, presence: true)
    validates(:species, inclusion: {in: ["Dog"]})

    # Class Methods
    def self.all_name_ordered
        self.order(name: :asc)
    end

end
