class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def search_params 
    @search_items = Item.order("created_at DESC").ransack(params[:q])
  end

  helper_method :search_params 

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic_auth_username && password == Rails.application.credentials.basic_auth_password
    end
  end
end