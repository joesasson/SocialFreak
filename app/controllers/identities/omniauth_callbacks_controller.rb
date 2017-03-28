class Identities::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    set_current_user
  end

  def github
    set_current_user
  end

  def google
    set_current_user
  end

  def linkedin
    set_current_user
  end

  def failure
    redirect_to root_path
  end

  def set_current_user
    begin
      @identity = Identity.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @identity.user.id
      flash[:success] = "Welcome, #{@identity.user.name}"
    rescue
      flash[:warning] = "There was an error with the authentication"
    end
    redirect_to root_path
  end
end
