require "jwt"

class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_accessor :is_authenticated, :user

    private
    def authenticate_request
        token = get_bearer_token
        if(token.present?)
            @is_authenticated = true
            @user = decode_token(token)[:user]
        else
            @is_authenticated = false
        end
    end

    def get_bearer_token
        auth_header = headers["Authorization"]
        if(auth_header.present?)
            auth_header.split(" ").last
        else
            nil
        end
    end

    def decode_token(token)
        JWT.decode(token, ENV["jwt_token"], true)[0]
    end
end
