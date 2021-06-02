class Api::Authentication::SessionsController < ::DeviseTokenAuth::SessionsController

	# This class inherits from DeviseTokenAuth in order to handle authentication
	# while maintaining the main ApplicationController for checking authenticity, etc
	# All of the methods are using SUPER right now...

	skip_before_action :verify_authenticity_token

end
