class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    root_path
  end
end
