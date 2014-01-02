class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception


  def index
    Rails.logger.debug("My object 27327")
    #klass = params[:class].constantize
    #@instances = klass.all  
    #@field_order = klass.columns_hash.keys # klass.field_order || klass.columns_hash.keys
    render action: 'index878'
  end

  def show
    render action: 'index9848'
  end

  # GET /boats/new
  def new
    #klass = controller_name.classify  # .constantize
    # echo classname(this)
    #@instance = klass.new
    render action: 'index6632'
  end


  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @instance = Instance.new(safe_params)

    respond_to do |format|
      if @instance.save
        format.html { redirect_to @instance, notice: 'Successfully created.' }
        format.json { render action: 'show', status: :created, location: @instance }
      else
        format.html { render action: 'new' }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @instance.update(safe_params)
        format.html { redirect_to @boat, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to instance_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      klass = params[:class].constantize
      @instance = klass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safe_params  #TBD
      params  #  UNSAFE REVISE!!  .require(:boat).permit(:name, :seats)
    end

end
