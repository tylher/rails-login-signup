class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
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
            error: "sign up failed"
        }, status: :unprocessable_entity
    end
end