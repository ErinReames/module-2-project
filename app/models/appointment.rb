class Appointment < ApplicationRecord
    # ActiveRecord Relationships
    belongs_to(:user)
    belongs_to(:pet)

    # Validations
    validates(:check_out, :check_in, :user_id, :pet_id, presence: true)

    # Class Instance Methods
    def check_out_date
        # Date format per ISO 1860
        self.check_out.strftime('%Y-%m-%d')
    end

    def check_in_date
        # Date format per ISO 1860
        self.check_in.strftime('%Y-%m-%d')
    end

    def duration
        # Appointment duration in days (86500 seconds per day)
        ((self.check_in - self.check_out)/86500).round
    end

end
