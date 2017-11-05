require "application_responder"

class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

   rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_in , keys: [ :full_name, :username, :birthday, :address, :city, :state, :country ] )
    devise_parameter_sanitizer.permit( :sign_up , keys: [ :full_name ,:username, :birthday, :address, :city, :state, :country ] )
    devise_parameter_sanitizer.permit( :account_update , keys: [:year, :full_name, :birthday, :address, :city, :state, :country ] )
  end



end
