class Api::Authentication::SessionsController < ::DeviseTokenAuth::SessionsController
	skip_before_action :verify_authenticity_token
end
