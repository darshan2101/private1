class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to root_url
      end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :role_id,:fName, :password,:password_confirmation,:lName,:contact,:dateOfBirth,:gender,:email,:expertise_ids => [],:addresses_attributes => %i[ id country state city local pincode _destroy]])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role_id,:fName, :password,:password_confirmation,:lName,:contact,:dateOfBirth,:gender,:email,:expertise_ids => [],:addresses_attributes => %i[ id country state city local pincode _destroy]])

  end
    

end
