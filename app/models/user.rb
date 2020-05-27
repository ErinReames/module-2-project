class User < ApplicationRecord
    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    has_many(:pets, through: :appointments)

    # Validations
    validates(:username, :phone, :address, presence: true)
    validates(:username, uniqueness: true) 

    # Class Instance Methods
    def upcoming_appointments
        Appointment.where("user_id = ? AND check_out >= ?", self.id, DateTime.now).order(check_out: :asc)
    end

    def previous_appointments
        Appointment.where("user_id = ? AND check_out < ?", self.id, DateTime.now).order(check_out: :desc)
    end

    # Class Methods
    def self.all_username_ordered
        self.order(username: :asc)
    end
    
end
