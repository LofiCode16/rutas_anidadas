class ApartmentsController < ApplicationController

    def index
        # if params[:q]
        #     @apartments = Apartment.where('owner LIKE ?', "%#{params[:q]}%").includes(:building)
        # else
        #     @apartments = Apartment.all.includes(:building)
        # end
        @building = Building.find(params[:building_id])
        
        if params[:q]
            @apartments = Apartment.where('building_id = ? AND owner LIKE ?', @building, "%#{params[:q]}%") 
        else
            @apartments = Apartment.where(building_id: @building)
        end
    end

    def show
        @building = Building.find(params[:building_id])
        @apartment = Apartment.find(params[:id])
    end    

    def new
        @apartment = Apartment.new
        @building = Building.find(params[:building_id])
        # @buildings = Building.all
    end

    def create
        @building = Building.find(params[:building_id])
        @apartment = Apartment.new(apartment_params.merge(building: @building))
        # @apartment.building = @building

        @apartment.save
        redirect_to building_apartments_path(@building)
    end

    private
    
    def apartment_params
        params.require(:apartment).permit(:number, :tower, :owner)
    end
end

