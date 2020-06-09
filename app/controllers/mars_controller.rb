class MarsController < ApplicationController

  before_action :authenticate_user!

  def index
    @mars = current_company.mars
  end

  def new
    @mar = current_company.mars.new
    @mar.medication_items.build
    @mar.medication_documents.build
    @mar.signature_lists.build
  end

  def create
    @mar =  current_company.mars.new(mar_params)
    @mar.created_by = current_user.id
    if @mar.save
      flash[:notice] = "Successfully created"
      redirect_to mars_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :new
    end
  end

  def edit
    @mar = current_company.mars.find_by_id(params[:id])
  end

  def show
    @mar = current_company.mars.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'mars/show', pdf: 'Mar Report-' + Time.now.strftime('%v %H:%M:%S').to_s,
               layout: 'pdf.html.erb', disposition: 'attachment'
      end
    end
  end


  def update
    @mar = current_company.mars.find_by_id(params[:id])
    if @mar.update_attributes(mar_params)
      flash[:notice] = "Successfully Saved"
      redirect_to mars_path
    else
      flash[:alert] = "Something worng please try again"
      render action: :edit
    end
  end

  def destroy
    @mar = current_company.mars.find_by_id(params[:id])
    if @mar.destroy
      flash[:notice] = "Successfully deleted!"
    else
      flash[:alert] = "Something went wrong, please try again!"
    end
    redirect_to action: :index
  end

  private

  def mar_params
    params.require(:mar).permit!
  end
end
