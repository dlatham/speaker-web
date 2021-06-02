class DevicesController < ApplicationController

	rescue_from ActionController::RoutingError, with: :not_found
	rescue_from Exception, with: :other_error


	def not_authorized(error="Not authorized")
		Rails.logger.warn("Not authorized: #{request.path}")
		render json: { message: error}, status: 401
	end


	def not_found(error)
		Rails.logger.warn("Not found: #{request.path}")
		render json: { message: "Not found" }, status: 404
		#rails.env.development? super : 
	end

	def other_error(error)
		Rails.logger.error(error)
		Rails.logger.error error.backtrace.join("\n") if Rails.env.development?
		render json: { error: true, message: error.message }, status: 500 and return if Rails.env.development?
		render json: { error: true, message: 'Something went wrong, please try again later' }, status: 500
	end

end
