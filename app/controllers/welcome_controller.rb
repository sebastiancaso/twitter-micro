class WelcomeController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]

	def index 
		# might want to initialize client variable in controller to avoid having to set variable globally
		@tweet =  $client.search("#healthcare -rt", lang: "en").take(10)
	end
end
