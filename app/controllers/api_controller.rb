class ApiController < ::ApplicationController

	rescue_from ActionController::RoutingError, with: :api_not_found
	rescue_from Exception, with: :api_other_error


	private

	def api_not_found(error)
		Rails.logger.warn("Not found: #{request.path}")
		render json: { message: "Not found" }, status: 404
		#rails.env.development? super : 
	end

	def api_other_error(error)
		Rails.logger.error(error)
		render json: { error: true, message: error.message }, status: 500
	end

end
