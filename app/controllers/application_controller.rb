class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :fetch_group, if: :pages_controller? || :groups_controller? || :users_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_to: :"/groups", if: :user_signed_in?



  def fetch_group
    @group = Group.find(params[:group_id])
  end

  def pages_controller?
    params[:controller] == "pages"
  end

  def groups_controller?
    params[:controller] == "groups"
  end

  def users_controller?
    params[:controller] == "users"
  end

  def search_controller?
    params[:controller] == "search"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
  end

  def after_sign_in_path_for(resource)
    '/groups'
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

end
