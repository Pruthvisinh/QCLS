class WelcomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to settings_users_path
    else
      redirect_to new_user_session_path
    end
  end

  def load_cities
    state = params[:state].to_s.to_sym
    country = params[:country].to_s.to_sym
    @cities = CS.cities(state, country)
    respond_to do |format|
      format.js {}
    end
  end

  def load_state
    country = params[:country].to_s.to_sym
    @id = params[:id]
    @calling_code =  IsoCountryCodes.find(country).calling
    @states = CS.states(country)
    respond_to do |format|
      format.js {}
    end
  end
end