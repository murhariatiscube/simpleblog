class StuffController < ApplicationController

  layout 'staff'
  
   #before_filter :authorize_access, :excpet=>[:login, :index,:send_login]
  
  def index
  login
  render(:action => 'login')
  end

  def login
  end

  def send_login
     found_user = User.authenticate(params[:username], params[:password])
	 if found_user
	     session[:user_id] = found_user.id
		 flash[:notice] = 'you are now log in'
		 redirect_to(:action => 'menu')
	 else
	     flash.now[:notice] = "username/password combination incorrect"
		 render(:action => 'login')
		 
	 end
  end
  
  def menu
  # just text
  end

  def logout
     session[:user_id] = nil
	 flash[:notice] = "you are logges out"
	 redirect_to(:action => 'login')
  end
end
