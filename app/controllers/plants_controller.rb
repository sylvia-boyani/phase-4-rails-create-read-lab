class PlantsController < ApplicationController

    def index
      plants = Plant.all 
      render json: plants, except: [:created_at, :updated_at]
    end
  
    def show
      plant = Plant.find_by_id(params[:id])
      if plant
        render json: plant, except: [:created_at, :updated_at]
      else
        render json: {error: "Could not find plant"}, status: :not_found
      end   
    end
  
    def create 
      plant = Plant.create(plant_params)
      render json: plant, status: :created
    end
  
    private
    def plant_params
      params.permit(:name, :image, :price)
    end
  end