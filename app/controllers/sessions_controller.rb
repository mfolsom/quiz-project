class SessionsController < ApplicationController
    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, :notice => "Welcome #{user.username}!"
      else
        flash.alert = "Invalid username or password"
        redirect_to sign_in_path
      end
    end

end
