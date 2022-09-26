class SpicesController < ApplicationController


    def index
        spices = Spice.all
        render json: spices
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
    def update
        spice = Spice.find(params[:id])
        if spice 
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found" }, status: 404
        end
    end
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end
    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
