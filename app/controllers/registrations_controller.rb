class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    company =  Company.create(company_params)
    build_resource(sign_up_params)
    resource.company_id = company.id
    resource.role = User::ROLES[:admin]
    resource.save
    # redirect_to root_path
    flash[:notice] = "You will receive an email with instructions for how to confirm your email address in a few minutes."
    redirect_to new_session_path(resource)
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation,:first_name, :last_name, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:first_name, :last_name])
  end

  # If you have extra params to permit, append them to the sanitizer

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def company_params
    params[:user][:company].permit!
  end

end
