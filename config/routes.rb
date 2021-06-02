Rails.application.routes.draw do

	devise_for :users
	root to: 'home#index'

	namespace :api, defaults: {format: :json} do
		namespace :v1 do
			scope module: 'api_auth' do
				mount_devise_token_auth_for 'User', at: 'auth', controllers: {
					sessions: 'api/authentication/sessions'
				}
			end
			get :ping, to: 'application#ping'
			resources :devices, only: [:show]
		end
	end

	namespace :devices, defaults: {format: :json} do
		namespace :v1 do
			resources :tokens, only: [:create]
		end
	end

end
