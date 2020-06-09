class LlcServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @llc_services =  current_company.llc_services
    else
      @llc_services =  current_user.llc_services
    end
  end

  def new
    @llc_service = LlcService.new
    @llc_service.build_hpc_service
    @llc_service.location_services.build
    @llc_service.change_services.build
    @llc_service.signature_lists.build
  end

  def create
    @llc_service =  current_company.llc_services.new(llc_service_params)
    @llc_service.user_id = current_user.id
    if @llc_service.save
      flash[:notice] = "LLC Services is successfully created"
      redirect_to llc_services_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :new
    end
  end


  def edit
    @llc_service = current_company.llc_services.find_by_id(params[:id])
  end

  def show
    @llc_service = current_company.llc_services.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'llc_services/show', pdf: 'Monthly-service-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
    end
  end

  def update
    @llc_service = current_company.llc_services.find_by_id(params[:id])
    if @llc_service.update_attributes(llc_service_params)
      flash[:notice] = "LLC Services is successfully Saved"
      redirect_to llc_services_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end


  def destroy
    @llc_service = current_company.llc_services.find_by_id(params[:id])
    if @llc_service.destroy
      flash[:notice] = "Successfully deleted!"
    else
      flash[:alert] = "Something went wrong, please try again!"
    end
    redirect_to action: :index
  end

  private

  def llc_service_params
    params.require(:llc_service).permit!
  end
end
