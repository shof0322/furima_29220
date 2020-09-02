class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show] # ログインしていないユーザーをサインアップ画面へ促す
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :name_first, :name_last, :name_kana_first, :name_kana_last, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
