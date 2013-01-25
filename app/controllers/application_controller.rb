class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :scope_current_site
  
#  check_authorization :unless => :devise_controller?
  
  def current_site
    @current_site ||= Site.first
  end  
  helper_method :current_site
  
  def scope_current_site
    Site.current_id = current_site.try(:id)
    self.class.layout 'custom' if current_site.try(:custom_layout?) 
    Rails.logger.info "SITE CURRENT ID => #{Site.current_id}"
    Rails.logger.info "DOMAIN => #{domain}"
    Rails.logger.info "SUBDOMAIN => #{subdomain}"
  end
  
  def domain
    request.domain
  end
  
  def subdomain
    request.subdomain
  end
end
