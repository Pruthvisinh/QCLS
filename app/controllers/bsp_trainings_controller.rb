class BspTrainingsController < ApplicationController

  before_action :authenticate_user!
  def index

    if current_user.admin?
      @bsp_trainings = current_company.bsp_trainings
      @name = ''
    else
      @bsp_trainings = current_user.bsp_trainings
      @name = current_user.full_name
    end

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'bsp_trainings/index', pdf: 'Company Detail Report-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
      end
  end

  def new
    @bsptraining = BspTraining.new
  end

  def create
    @bsptraining =  current_company.bsp_trainings.new(bsp_training_params)
    @bsptraining.created_by = current_user.id
    if @bsptraining.save
      flash[:notice] = "ISP/BSP Trainings is successfully created"
      redirect_to bsp_trainings_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :new
    end
  end

  def edit
    @bsptraining = current_company.bsp_trainings.find_by_id(params[:id])
  end

  def update
    @bsptraining = current_company.bsp_trainings.find_by_id(params[:id])
    if @bsptraining.update_attributes(bsp_training_params)
      flash[:notice] = "ISP/BSP Training is successfully Saved"
      redirect_to bsp_trainings_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end

  def destroy
    @bsptraining = current_company.bsp_trainings.find_by_id(params[:id])
    if @bsptraining.destroy
      flash[:notice] = "ISP/BSP Training  successfully deleted!"
    else
      flash[:alert] = "Something went wrong, please try again!"
    end
    redirect_to action: :index
  end


  private

  def bsp_training_params
    params.require(:bsp_training).permit!
  end
end
