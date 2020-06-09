class MedicationsController < ApplicationController

  before_action :authenticate_user!

  def index
    if current_user.admin?
      @medications = current_company.medications
    else
      @medications = current_user.medications
    end
  end

  def new
    @medication = current_company.medications.new
    @medication.ist_informations.build
  end

  def create
      @medication =  current_company.medications.new(medication_params)
      @medication.created_by = current_user.id
      @medication.edited_by = current_user.id
      if @medication.save
        flash[:notice] = "Medication is successfully created"
        redirect_to medications_path
      else
        flash[:alert] = "Something worng please try again"
        render action: :new
      end
  end

  def edit
    @medication = current_company.medications.find_by_id(params[:id])
  end

  def show
    @medication = current_company.medications.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'medications/show', pdf: 'Medication Report-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
    end
  end

  def update
    @medication = current_company.medications.find_by_id(params[:id])
    @medication.edited_by = current_user.id
    if @medication.update_attributes(medication_params)
      flash[:notice] = "Medications is successfully Saved"
      redirect_to medications_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end

  def destroy
    @medication = current_company.medications.find_by_id(params[:id])
    if @medication.destroy
      flash[:notice] = "Medications successfully deleted!"
    else
      flash[:alert] = "Something went wrong, please try again!"
    end
    redirect_to action: :index
  end

  private

  def medication_params
    params.require(:medication).permit!
  end
end
