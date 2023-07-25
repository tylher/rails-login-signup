# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, opt = {})
    register_success && return if resource.persisted?

    register_failed(resource)
  end

  def register_success
    render json: {
      data: current_user,
      status_code: 200,
      message: "user created successfully",
    }, status: :ok
  end

  def register_failed(res)
    if User.exists? email: res.email
      render json: {
               message: "user exists already, please try to login",
               errors: res.errors,
             }, status: :conflict
      return
    end
    render json: {
      message: "user could not be created successfully",
      errors: res.errors,
    }, status: :unprocessable_entity
  end
end
