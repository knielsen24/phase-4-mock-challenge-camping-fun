class CampersController < ApplicationController
	# rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
	def index
		campers = Camper.all
		render json: campers, status: :ok
	end

	def show
		camper = Camper.find_by(id: params[:id])
		if camper.id
			render json: camper, include: :activities, status: :ok
		else
			render json: { error: "Camper not found"}, status: :not_found
		end
	end

	def create
		if campers_params
			camper = Camper.create(campers_params)
			render json: camper, status: :created
		else
			render json: { error: "Camper not found"}, status: 422
		end
	end

	private

	def campers_params
		params.permit(:name, :age)
	end

	# def record_not_found(exception)
	# 	render json: { error: exception.message }, status: :not_found
	# end

end
