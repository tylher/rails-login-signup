class MembersController < ApplicationController
    before_action :authenticate_user!

    def show
        user = get_user_from_token
        render json:{
            user: user,
            message: 'If you are seeing this, you are in!'
        }
    end

    private 
    def get_user_from_token
        token = request.headers['Authorization'].split(' ')[1]
        payload = JWT.decode(token,Rails.application.credentials.devise[:jwt_secret_key]).first
        user = User.find(payload['sub'].to_s)
    end
end
