class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index] #ログインしていないユーザーをサインアップ画面へ促す
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :name_first, :name_last, :name_kana_first, :name_kana_last, :birthday])
  end
end
