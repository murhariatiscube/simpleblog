class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authorize_access
     if !session[:user_id]
	 flash[:notice] = "Please log in."
	 redirect_to(:controller => "stuff", :action => 'login')
	 return false
	 end
  end
end
