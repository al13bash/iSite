class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_i18n_locale_from_params
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
  
  def defaul_url_options
    { locale: I18n.locale }
  end
 
  protected
   
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to catalog_path
  end
end
