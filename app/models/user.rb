class User < ApplicationRecord
    # Rails Password Encryption
    has_secure_password

    # ActiveRecord Relationships
    has_many(:appointments)
    has_many(:reviews)
    has_many(:pets, through: :appointments)

    # Validations
    validates(:username, :phone, :address, :password, :password_confirmation, presence: true)
    validates(:username, uniqueness: true) 
    validates(:password, confirmation: true)

    # Class Instance Methods
    def upcoming_appointments
        Appointment.where("user_id = ? AND check_out >= ?", self.id, DateTime.now).order(check_out: :asc)
    end

    def upcoming_appointments_count
        self.upcoming_appointments.count
    end

    def previous_appointments
        Appointment.where("user_id = ? AND check_out < ?", self.id, DateTime.now).order(check_out: :desc)
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
    def self.all_username_ordered
        self.order(username: :asc)
    end
    
end
