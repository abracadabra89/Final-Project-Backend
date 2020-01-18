class ApplicationController < ActionController::API
	
	def user_id
		decoded_token[0]['user_id']
	end
	
	def current
		@user ||= User.find_by(id: user_id)
	end
	
	def logged_in
		!!current
	end
	
	def decoded_token
		JWT.decode(request.headers['Authorization'], ENV["KEY"], true, {algorithm: 'HS256'})
	end
	
	def encoded_token(user)
		JWT.encode({user_id: user.id}, ENV["KEY"], 'HS256')
	end
end
