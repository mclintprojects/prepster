class AuthController < ApplicationController
    def login
        render json: {is_authenticated: is_authenticated}
    end
end
