class ContactSegmentationsController < ApplicationController
  before_action :set_contact_segmentation, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  def index
    @contact_segmentations = ContactSegmentation.all
  end

  def show
    @contacts = Contact.filter(@contact_segmentation.filter_conditions)
  end

  def new
    @contact_segmentation = ContactSegmentation.new
  end

  def edit
  end

  def create
    @contact_segmentation = ContactSegmentation.new(contact_segmentation_params)

    respond_to do |format|
      if @contact_segmentation.save
        format.html { redirect_to action: "index", notice: 'Contact segmentation was successfully created.' }
        format.json { render :show, status: :created, location: @contact_segmentation }
      else
        format.html { render :new }
        format.json { render json: @contact_segmentation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @contact_segmentation.update(contact_segmentation_params)
        format.html { redirect_to @contact_segmentation, notice: 'Contact segmentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_segmentation }
      else
        format.html { render :edit }
        format.json { render json: @contact_segmentation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact_segmentation.destroy
    respond_to do |format|
      format.html { redirect_to contact_segmentations_url, notice: 'Contact segmentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_segmentation
      @contact_segmentation = ContactSegmentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_segmentation_params
      params.require(:contact_segmentation).permit(:description, filter_conditions_attributes: [:id, :mandatory, :field, :comparator, :value, :_destroy])
    end
end
