class PetsController < ApplicationController

    def index
        @pets = Pet.all
    end

    def show
        @pet = Pet.find[:id]
    end


end
