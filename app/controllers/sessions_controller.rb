class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]  
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth)

    session[:user_id] = user.id  
    session['fb_auth'] = auth
    session['fb_access_token'] = auth['credentials']['token']
    session['fb_error'] = nil

    redirect_to fuser_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
