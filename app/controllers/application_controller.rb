class ApplicationController < ActionController::API
	include ActionController::Cookies

	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	rescue_from ActiveRecord::RecordInvalid, with: :not_valid_response

	private

	def record_not_found(exception)
		render json: { error: "#{exception.model} not found" }, status: :not_found
	end


	def not_valid_response(exception)
		render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
	end
end
