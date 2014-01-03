class ApplicationController < ActionController::Base
  #  @@model = Boat
  #  @@field_order = Boat.columns_hash.keys 

  #    @model = params["controller"].classify.constantize
  #    # set @field_order once when loading this class.
  #    @field_order = @model.columns_hash.except(:id, :created_at, :updated_at).keys 
  #def self.model
  #  @@groups ||= []
  #end

  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  before_action :set_model,   only: [:new, :create, :index]
  protect_from_forgery with: :exception


  def index
    @instances = @model.all
    #Rails.logger.debug("in index with: #{@instance}, #{@model}, #{@field_order}")
  end

  def show
  end

  # GET /boats/new
  def new
    @instance = @model.new
  end

  def edit
  end

  def create
    @instance = @model.new(safe_params)

    respond_to do |format|
      if @instance.save 
        format.html do 
          flash[:notice] = 'Successfully created.'
          index  # to update @instances
          render :index
        end
        format.json { render action: 'show', status: :created, location: @instance }
      else
        format.html { render action: 'new' }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instance.update(safe_params)
        format.html { redirect_to @instance, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to instance_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance   #TBD move this into a method
      set_model
      @instance = @model.find(params[:id])
    end

    def set_model
      @model = params["controller"].classify.constantize
      @field_order = @model.columns_hash.except("id", "created_at", "updated_at").keys  # TODO HACK. Should use permissions matrix
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safe_params  #TBD.  use security settings to set safe_params
      params.require(@model.to_s.underscore).permit @field_order
    end

end
