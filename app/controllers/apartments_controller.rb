class ApartmentsController < ApplicationController

    def index
        if params[:q]
            @apartments = Apartment.where('owner LIKE ?', "%#{params[:q]}%").includes(:building)
        else
            @apartments = Apartment.all.includes(:building)
        end
    end

    def new
        @apartment = Apartment.new
        @buildings = Building.all
    end

    def create
        @apartment = Apartment.new(apartment_params)

        @apartment.save
        redirect_to root_path
    end

    private
    
    def apartment_params
        params.require(:apartment).permit(:number, :tower, :owner, :building_id)
    end
end

