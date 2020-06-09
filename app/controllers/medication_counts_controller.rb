class MedicationCountsController < ApplicationController

  before_action :authenticate_user!

  def index
    if current_user.admin?
      @medication_counts = current_company.medication_counts
    else
      @medication_counts = current_user.medication_counts
    end
  end

  def new
    @medication_count = current_company.medication_counts.new
    @medication_count.medication_count_items.build
    @medication_count.signature_lists.build
  end

  def create
    @medication_count =  current_company.medication_counts.new(medication_count_params)
    @medication_count.created_by = current_user.id
    @medication_count.edited_by = current_user.id
    if @medication_count.save
      flash[:notice] = "Medication Count is successfully created"
      redirect_to medication_counts_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :new
    end
  end


  def show
    @medication_count = current_company.medication_counts.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'medication_counts/show', pdf: 'Medication Count Report-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
    end
  end

  def edit
    @medication_count = current_company.medication_counts.find_by_id(params[:id])
  end

  def update
    @medication_count = current_company.medication_counts.find_by_id(params[:id])
    @medication_count.edited_by = current_user.id
    if @medication_count.update_attributes(medication_count_params)
      flash[:notice] = "Medication Counts is successfully Saved"
      redirect_to medication_counts_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end

  def destroy
    @medication_count = current_company.medication_counts.find_by_id(params[:id])
    if @medication_count.destroy
      flash[:notice] = "Medication Counts successfully deleted!"
    else
      flash[:alert] = "Something went wrong, please try again!"
    end
    redirect_to action: :index
  end


  private

  def medication_count_params
    params.require(:medication_count).permit!
  end
end
