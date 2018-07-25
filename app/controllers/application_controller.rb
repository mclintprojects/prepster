class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_accessor :is_authenticated, :user

    private
    def authenticate_request

    end
end
