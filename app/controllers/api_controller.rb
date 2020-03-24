class ApiController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :decrypt_params

	def decrypt_params
		params.each {|k, v| params[k] = JsonWebToken.decode(v)}
	end	

end