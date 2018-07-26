class AuthController < ApplicationController
    def login
        render json: {is_authenticated: is_authenticated}
    end

    def signup
        user = User.new(signup_params)
        if(user.save)
            render json: {user: ActiveModelSerializers::SerializableResource.new(User.find(user.id)), token: user.create_jwt}, status: 201
        else
            render json: {errors: user.errors.full_messages}, status: 422
        end
    end

    private

    def signup_params
        params.permit(
            :first_name,
            :last_name,
            :email,
            :password
        )
    end
end
