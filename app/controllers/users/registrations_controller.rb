class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :validate_email
    
    private
    def respond_with(resource,_opts={})
        register_success && return if resource.persisted?

        register_failed
    end

    def register_success
        render json:{
            user: current_user,
            message: "sign up successful"
        },status: :ok
    end

    def register_failed
        render json:{
            error: :exception
        }, status: :unprocessable_entity
    end

    def validate_email
        if User.find_by_email(params[:user][:email])
            render json:{
                error: "user already exists"
            },status: :forbidden
        end
    end
end