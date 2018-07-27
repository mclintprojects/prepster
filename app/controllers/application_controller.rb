require "jwt"

class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_accessor :auth_user

    def authenticated?
        @is_authenticated
    end

    def verify_authorized
        head(401) unless authenticated?
    end

    private

    attr_accessor :is_authenticated

    def authenticate_request
        begin
            token = get_bearer_token
            if(token.present?)
                @auth_user = User.find(decode_token(token)["user_id"])
                @is_authenticated = @auth_user.present?
            else
                @is_authenticated = false
            end
        rescue => exception
            @is_authenticated = false
        end
    end

    def get_bearer_token
        auth_header = request.headers["Authorization"]
        if(auth_header.present?)
            auth_header.split(" ").last
        else
            nil
        end
    end

    def decode_token(token)
        JWT.decode(token, ENV["jwt_secret"], true, {algorithm: "HS256"})[0]["data"]
    end
end
