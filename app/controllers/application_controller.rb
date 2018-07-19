class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # forces user login for all actions on all controllers
    before_action :authenticate_user!
end
