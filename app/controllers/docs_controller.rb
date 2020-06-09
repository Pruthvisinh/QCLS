class DocsController < ApplicationController
  before_action :set_doc, only: [:edit, :update, :destroy]

  def index
    @docs = Doc.send(params[:type] || 'isp' ).page(params[:page])
  end

  def new
    @doc = Doc.new(doc_type: params[:type])
  end

  def edit
  end

  def destroy
    @doc.destroy
    flash[:notice] = "Doc is destroyed"
    redirect_to docs_path(type: @doc.doc_type)
  end

  def create
    authorize! :manage, Doc
    @doc = Doc.new doc_params

    if @doc.save
      flash[:notice] = "Doc is uploaded"
      redirect_to docs_path(type: @doc.doc_type)
    else
      flash[:alert] = @doc.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def update
    authorize! :manage, Doc

    p doc_params
    if @doc.update(doc_params)
      flash[:notice] = "Doc is uploaded"
      redirect_to docs_path(type: @doc.doc_type)
    else
      flash[:alert] = @doc.errors.full_messages.to_sentence
      render action: :edit
    end
  end

  private ##

  def set_doc
    @doc = Doc.find(params[:id])
  end

  def doc_params
    params.require(:doc).permit(:name, :user_id, :description, :file, :doc_type)
  end
end
