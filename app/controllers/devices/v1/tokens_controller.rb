class Devices::V1::TokensController < Devices::V1::ApplicationController

	def create

		# Requests a token from the Ably service and returns it to the client for subscribing
		# and publishing realtime events. This currently happens hourly:

		token = current_device.token_request
		render json: token, status: 200

	end

end
