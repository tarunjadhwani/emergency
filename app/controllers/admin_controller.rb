class AdminController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "password"
  # before_action :authenticate_admin!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end