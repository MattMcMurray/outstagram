class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # TODO: match to user's current path if not coming from welcome screen
    "/feed"
  end
end
