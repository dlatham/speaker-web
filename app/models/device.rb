class Device < ApplicationRecord
	belongs_to :user, optional: true
	validates :mac, presence: true

	after_create :provision_new_device_tasks

	def token_request

		client = Ably::Rest.new(key: Rails.application.credentials.ably[:key])
		@token_request = client.auth.request_token(client_id: self.mac)
		self.token = @token_request.token
		self.save!
		@token_request

	end

	private


	def provision_new_device_tasks

		# Get a token from Ably to handle messaging:
		token_request

	end




end
