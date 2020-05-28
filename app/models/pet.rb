class Pet < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    belongs_to(:store)
    has_many(:users, through: :appointments)

    # Validations
    validates(:name, :species, :breed, :age, :weight, presence: true)
    validates(:species, inclusion: {in: ["Dog"]})

    # Class Instance Methods
    def average_review_rating
        if self.reviews.count > 0
            (self.reviews.sum{|review| review.rating}/(self.reviews.count.to_f)).round(1)
        else
            "Not yet Rated"
        end
    end

    def upcoming_appointments
        Appointment.where("pet_id = ? AND check_out >= ?", self.id, DateTime.now).order(check_out: :asc)
    end

    def upcoming_appointments_count
        self.upcoming_appointments.count
    end

    def previous_appointments
        Appointment.where("pet_id = ? AND check_out < ?", self.id, DateTime.now).order(check_out: :desc)
    end

    def previous_appointments_count
        self.previous_appointments.count
    end

    def reviews_count
        self.reviews.count
    end

    def reviews_date_ordered
        self.reviews.order(updated_at: :desc)
    end

    # Class Methods
    def self.all_name_ordered
        self.order(name: :asc)
    end

end
