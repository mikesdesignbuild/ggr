class MemberProfilesController < ApplicationController
  before_action :set_member_profile, only: [:show, :edit, :update, :destroy]

  # GET /member_profiles
  # GET /member_profiles.json
  def index
    @member_profiles = MemberProfile.all
  end

  # GET /member_profiles/1
  # GET /member_profiles/1.json
  def show
  end

  # GET /member_profiles/new
  def new
    @member_profile = MemberProfile.new
  end

  # GET /member_profiles/1/edit
  def edit
  end

  # POST /member_profiles
  # POST /member_profiles.json
  def create
    @member_profile = MemberProfile.new(member_profile_params)

    respond_to do |format|
      if @member_profile.save
        format.html { redirect_to @member_profile, notice: 'Member profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @member_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_profiles/1
  # PATCH/PUT /member_profiles/1.json
  def update
    respond_to do |format|
      if @member_profile.update(member_profile_params)
        format.html { redirect_to @member_profile, notice: 'Member profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_profiles/1
  # DELETE /member_profiles/1.json
  def destroy
    @member_profile.destroy
    respond_to do |format|
      format.html { redirect_to member_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_profile
      @member_profile = MemberProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_profile_params
      params.require(:member_profile).permit(:name)
    end
end
