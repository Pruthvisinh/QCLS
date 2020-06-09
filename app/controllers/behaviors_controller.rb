class BehaviorsController < ApplicationController

  def index
    if current_user.admin?
      @behaviors = current_company.behaviors
    else
      @behaviors = current_user.behaviors
    end
  end

  def new
    @behavior = current_company.behaviors.build
    @behavior.build_restricted_measure
    @behavior.behavior_outcomes.build
    @behavior.signature_lists.build
  end

  def create
    @behavior = current_company.behaviors.new(behavior_params)
    if @behavior.save
      flash[:notice] = "LLC Services is successfully created"
      redirect_to behaviors_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :new
    end
  end

  def edit
    @behavior = current_company.behaviors.find_by_id(params[:id])
  end

  def update
    @behavior = current_company.behaviors.find_by_id(params[:id])
    if @behavior.update_attributes(behavior_params)
      flash[:notice] = "Monthly Behavior is successfully Saved"
      redirect_to behaviors_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end


  def show
    @behavior = current_company.behaviors.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'behaviors/show', pdf: 'Monthly-behavior-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
    end
  end


  private

  def behavior_params
    params.require(:behavior).permit!
  end
end
