# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!
  respond_to :json

  private

  def respond_with(resource, opts = {})
    render json: {
             message: "Logged in successfully",
             data: current_user,
           }, status: :ok
  end

  def respond_to_on_destroy
    sign_out_success && return if current_user

    sign_out_failed
  end

  def sign_out_success
    render json: {
      message: "Signed out successfully",
    }, status: :ok
  end

  def sign_out_failed
    render json: {
      message: "sign out failed",
    }, status: :unauthorized
  end
end
