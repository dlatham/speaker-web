class Api::V1::ApplicationController < ::ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!
      
      include DeviseTokenAuth::Concerns::SetUserByToken

      def ping
      	render json: {message: "pong"}, status: 200
      end

end
