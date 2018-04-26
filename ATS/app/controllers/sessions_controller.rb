class SessionsController < ApplicationController
    # Ethan Widen 3/17/18
    skip_before_action :require_login, only: [:create]
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        puts user
        if user
            session[:user_id] = user.id
            session[:role_id] = user.role_id
            redirect_to root_path
        else
            self.destroy
            #redirect_to root_path
            flash[:warning] = "You are not whitelisted to login"
        end
    end

    def destroy
        session[:user_id] = nil
        #session[:role_id] = nil
        redirect_to root_path
    end
end
