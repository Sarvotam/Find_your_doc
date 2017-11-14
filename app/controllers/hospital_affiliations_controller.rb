class HospitalAffiliationsController < ApplicationController
  before_action :set_hospital_affiliation, only: [:show, :edit, :update, :destroy]
   before_action :doctor_authentication, except: [:index]

  # GET /hospital_affiliations
  # GET /hospital_affiliations.json
  def index
    @hospital_affiliations = HospitalAffiliation.all
  end

  # GET /hospital_affiliations/1
  # GET /hospital_affiliations/1.json
  def show
  end

  # GET /hospital_affiliations/new
  def new
    @hospital_affiliation = HospitalAffiliation.new
  end

  # GET /hospital_affiliations/1/edit
  def edit
  end

  # POST /hospital_affiliations
  # POST /hospital_affiliations.json
  def create
    @hospital_affiliation = HospitalAffiliation.new(hospital_affiliation_params)
    @hospital_affiliation.doctor_id = current_user.doctor.id

    respond_to do |format|
      if @hospital_affiliation.save
        format.html { redirect_to @hospital_affiliation, notice: 'Hospital affiliation was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_affiliation }
      else
        format.html { render :new }
        format.json { render json: @hospital_affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_affiliations/1
  # PATCH/PUT /hospital_affiliations/1.json
  def update
    respond_to do |format|
      if @hospital_affiliation.update(hospital_affiliation_params)
        format.html { redirect_to @hospital_affiliation, notice: 'Hospital affiliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_affiliation }
      else
        format.html { render :edit }
        format.json { render json: @hospital_affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_affiliations/1
  # DELETE /hospital_affiliations/1.json
  def destroy
    @hospital_affiliation.destroy
    respond_to do |format|
      format.html { redirect_to hospital_affiliations_url, notice: 'Hospital affiliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_affiliation
      @hospital_affiliation = HospitalAffiliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_affiliation_params
            params.require(:hospital_affiliation).permit(:affiliation, :city, :country, :start_date, :contact, :address )
    end


    # def doctor_authentication
    #   if current_user.doctor.profile_confirmation == false
    #     redirect_to root_path
    #   end
    # end
end
