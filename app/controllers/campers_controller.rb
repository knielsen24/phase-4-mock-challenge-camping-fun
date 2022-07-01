class CampersController < ApplicationController
	rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
	def index
		campers = Camper.all
		render json: campers, status: :ok
	end

	def show
		camper = Camper.find(params[:id])
		render json: camper, include: :activities, status: :ok
	end

	def create
		camper = Camper.create(campers_params)
		render json: camper, status: :created
	end

	private

	def campers_params
		params.permit(:name, :age)
	end

	def record_not_found(exception)
		render json: { error: "Camper not found" }, status: :not_found
	end

end
