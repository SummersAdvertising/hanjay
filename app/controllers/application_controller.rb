class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :clear_config
  
  def require_is_admin
  	unless(session[:admin])
  		redirect_to admin_log_in_path
  	end
  end
  
  def clear_config
  	$title = nil
  	$meta_content = nil
  end
  
end
