class Devices::V1::ApplicationController < DevicesController

	skip_before_action :verify_authenticity_token
	before_action :authenticate_device!


	def authenticate_device!
		self.current_device = Device.find_by(mac: request.headers['x-device-id'])
		puts "Authenticated with device #{current_device}"
		not_authorized unless current_device.present?
	end

	def current_device=(device)
		@current_device = device
	end

	def current_device
		@current_device
	end



	# def device_request_token

	# 	# This handles a device requesting a new token to subscribe to Ably
	# 	# realtime. The tokens expire hourly which is somewhat of a pain for
	# 	# the device to need to do this so frequently:

	# 	# https://ably.com/documentation/core-features/authentication#token-authentication

	# 	begin
	# 		device = Device.find_by(mac: params[:id])
	# 		token = device.request_token
	# 		render json: token, status: 200
	# 	rescue -> e
	# 		render json: {errors: true, message: e}, status: 401
	# 	end

	# end

end
