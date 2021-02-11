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
    end

    def create
        @building = Building.new(building_params)

        @building.save
        redirect_to buildings_index_path
    end

    private

    def building_params
        params.require(:building).permit(:name, :address)
    end
end