class AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if(user.authenticate(params[:password]))
            render json: {user: ActiveModelSerializers::SerializableResource.new(user),
            token: user.create_jwt}, status: 200
        else
            render json: {errors: ["Invalid email or password"] }, status: 403
        end
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
