class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :flash_types
  helper_method :current_company

  rescue_from CanCan::AccessDenied do |exception|
    flash[:errors] = "You cannot access this page"
    redirect_to root_path
  end

  def current_company
    current_user.company if current_user.present?
  end

  def check_admin_or_staff
    unless current_user.admin? || current_user.staff?
      redirect_to root_path
    end
  end

  def flash_types
    ['info', 'success', 'danger', 'warning', 'alert', 'error']
  end
end
