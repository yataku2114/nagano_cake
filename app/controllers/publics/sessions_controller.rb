# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
  before_action :reject_inactive_public, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_inactive_public
    @public = Public.find_by(email: params[:public][:email].downcase)
    if @public
      if(@public.valid_password?(params[:public][:password]) && (@public.active_for_authentication? == false))
        flash[:error] = "退会済みです"
        redirect_to new_public_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
