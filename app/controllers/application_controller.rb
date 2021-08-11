class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_admin_top_path
    when Public
      root_path
    end
  end


  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :public
      new_public_session_path
    end
  end
end
