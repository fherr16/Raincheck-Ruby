module MsessionsHelper
  def log_in(muser)
    session[:muser_id] = muser.id
  end
  
  def current_muser
    @mcurrent_user ||=Muser.find_by(id: session[:muser_id])
  end
  
  def logged_in?
    !current_muser.nil? 
  end
  
  def log_out
    session.delete(:muser_id)
    @mcurrent_user = nil
  end
end
