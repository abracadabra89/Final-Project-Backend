class ApplicationController < ActionController::API
  
    def encoded_token(user)
     JWT.encode({user_id: user.id}, 'dshg5d4', 'HS256')
    end

    def auth_header
        request.headers["Authorization"]
    end

    def current_person
      @user ||= User.find_by(id: user_id)
    end

    def decoded_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, 'dshg5d4', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in
      !!current_person
    end


    # def decoded_token
    #   JWT.decode(request.headers['Authorization'], 'dshg5d4', true, {algorithm: 'HS256'})
    # end

    def user_id
      decoded_token[0]['user_id']
    end

  

end
  
