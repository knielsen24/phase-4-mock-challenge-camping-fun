class ActivitiesController < ApplicationController

	def index
		activities = Activity.all
		render json: activities, status: :ok
	end

	def delete

	private

	def activies_params
		params.permit(:name, :difficulty)
	end


end


