module CurrentRaincheck
   extend ActiveSupport::Concern

   private
     def set_raincheck
       @raincheck = Raincheck.find(session[:raincheck_id])
       rescue ActiveRecord::RecordNotFound
       @raincheck = Raincheck.create
       session[:raincheck_id] = @raincheck.id
     end
end