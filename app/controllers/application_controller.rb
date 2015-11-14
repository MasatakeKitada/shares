class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_group, if: :pages_controller? || :groups_controller? || :users_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # サインアップ後にグループ追加に繊維させるパス
  # before_action :after_sign_in_path_for
  # def after_sign_in_path_for(resource)
  #   '/groups/new'
  # end

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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
  end

end
