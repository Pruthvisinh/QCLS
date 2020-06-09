class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  load_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :destroy, :update, :show, :reset_password]
  before_action :check_manage_permissions, except: [:index, :settings, :edit_password, :update_password]
  before_action :check_read_permission, only: [:index, :show]

  def index
    @user_type = user_type
    @users = User.where(role: user_type)

    if params[:search].present?
      search =  params[:search]
      @users = @users.where("
        first_name iLike :q OR 
        last_name iLike :q OR 
        state iLike :q OR 
        email iLike :q OR 
        medicare_number iLike :q OR 
        medicaid_number iLike :q", q: "%#{search}%"
      )
    end

    if params[:gender].present?
      @users = @users.where(gender: params[:gender])
    end

    if params[:active].present?
      @users = @users.where(active: params[:active])
    end

    @users = @users.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new(role: user_type)
  end

  def create
    @user = User.new(user_params)
    
    password = Devise.friendly_token.first(8)
    @user.password = password
    @user.password_confirmation =  password
    @user.confirmed_at = Time.now

    authorize!(:manage, @user)

    if @user.save
      flash[:notice] = "User is created"
      redirect_to users_path(type: @user.role)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User is saved"
      redirect_to users_path(type: @user.role)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render action: :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User is destroyed"
    redirect_to users_path(type: @user.role)
  end

  def reset_password
    @user.send_reset_password_instructions
    flash[:notice] = "Reset password email is sent"
    redirect_to users_path(type: @user.role)
  end

  def settings
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
        flash[:notice] = "Password is updated"
        redirect_to root_path
    else
      flash[:alert] = "Something worng please try again"
      render "edit_password"
    end
  end

  private ##

  def user_params
    params.require(:user).permit!
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_manage_permissions
    if @user.present? 
      authorize!(:manage, @user)
    else
      authorize!(:manage, user_type.to_sym)
    end
  end

  def check_read_permission
    authorize!(:read, user_type.to_sym)
  end

  def user_type
    params[:type] || 'individual'
  end
end
