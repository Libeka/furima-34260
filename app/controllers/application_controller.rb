class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, omly:[:show, :new, :create, :edit, :update, :destroy]

  def index
  end

  def show
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day])
  end
end
