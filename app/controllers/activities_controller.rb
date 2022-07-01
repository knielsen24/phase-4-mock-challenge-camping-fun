class ActivitiesController < ApplicationController
	rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		activities = Activity.all
		render json: activities, status: :ok
	end

	def destroy
		activity = Activity.find(params[:id])
		activity.destroy
		# render json: { errors: activity.messages}, status: :not_found
		# record_not_found(activity)
	end

	private

	def record_not_found(exception)
		render json: { error: "Not found" }, status: :not_found
	end

end


