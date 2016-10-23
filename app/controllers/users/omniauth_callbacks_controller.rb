class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env['omniauth.auth'], current_user)

    if user.persisted?
      sign_in_and_redirect(user)
    else
      redirect_to root_path
    end
  end

  alias_method :twitter, :all
  alias_method :mastodon, :all

  def failure
    redirect_to root_path
  end
end
