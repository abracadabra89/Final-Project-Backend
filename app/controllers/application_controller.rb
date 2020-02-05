class ApplicationController < ActionController::API
  
    def encoded_token(user)
     JWT.encode({user_id: user.id}, 'my_s3cr3t', 'HS256')
    end

    def auth_header
        request.headers["Authorization"]
    end

    def current_person
      @user ||= User.find_by(id: user_id)
    end

    def logged_in
      !!current_person
    end


    def decoded_token
      JWT.decode(request.headers['Authorization'], 'my_s3cr3t', true, {algorithm: 'HS256'})
    end

    def user_id
      decoded_token[0]['user_id']
    end

  

end
  
