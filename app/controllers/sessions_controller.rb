class SessionsController < ApplicationController
  def create
    begin
      auth = request.env['omniauth.auth']
      # @user = User.from_omniauth(request.env['omniauth.auth'])
      unless @identity = Identity.find_with_omniauth(auth)
        @identity = Identity.create_with_omniauth(auth)
      end



      session[:user_id] = @identity.user.id
      flash[:success] = "Welcome, #{@identity.user.name}"
    rescue
      flash[:warning] = "There was an error with the authentication"
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Successfully Logged Out'
    end
    redirect_to root_path
  end
end
