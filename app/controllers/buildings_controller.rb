class BuildingsController < ApplicationController

    def index
        if params[:q]
            @buildings = Building.where('name LIKE ?', "%#{params[:q]}%")
        else
            @buildings = Building.all
        end
    end

    def new
        @building = Building.new
        @building.apartments.build
    end

    def create
        @building = Building.new(building_params)

        @building.save
        redirect_to root_path
    end

    def destroy
        @building = Building.find(params[:id])
        @building.destroy

        redirect_to root_path
    end

    private

    def building_params
        params.require(:building).permit(:name, :address, apartments_attributes: [:number, :tower, :owner])
    end
end