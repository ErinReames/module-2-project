class AppointmentsController < ApplicationController
    # Action/Route Filters
    before_action(:assign_appointment, only: [:show])

    # Action/Route Methods
    def index
        @appointments = Appointment.all_date_ordered
    end

    def show
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
            redirect_to(appointment_path(@appointment))
        else
            flash[:errors] = @appointment.errors.full_messages
            redirect_to(new_appointment_path)
        end
    end
    
    # Private Class Instance Helper Methods
    private
    def assign_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:check_out, :check_in, :user_id, :pet_id)
    end

end