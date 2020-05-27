class PetsController < ApplicationController

    def index
        @pets = Pet.all
    end

    def show
        @pet = Pet.find(params[:id])
    end

    private

    def pet_params
        params.require(:pet).permit(:name)
    end
end
