class DoctorSpecializationsController < ApplicationController
  before_action :set_doctor_specialization, only: [:show, :edit, :update, :destroy]

  # GET /doctor_specializations
  # GET /doctor_specializations.json
  def index
    @doctor_specializations = DoctorSpecialization.all
  end

  # GET /doctor_specializations/1
  # GET /doctor_specializations/1.json
  def show
  end

  # GET /doctor_specializations/new
  def new
    @doctor_specialization = DoctorSpecialization.new
  end

  # GET /doctor_specializations/1/edit
  def edit
  end

  # POST /doctor_specializations
  # POST /doctor_specializations.json
  def create
    @doctor_specialization = DoctorSpecialization.new(doctor_specialization_params)

    respond_to do |format|
      if @doctor_specialization.save
        format.html { redirect_to @doctor_specialization, notice: 'Doctor specialization was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_specialization }
      else
        format.html { render :new }
        format.json { render json: @doctor_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_specializations/1
  # PATCH/PUT /doctor_specializations/1.json
  def update
    respond_to do |format|
      if @doctor_specialization.update(doctor_specialization_params)
        format.html { redirect_to @doctor_specialization, notice: 'Doctor specialization was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_specialization }
      else
        format.html { render :edit }
        format.json { render json: @doctor_specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_specializations/1
  # DELETE /doctor_specializations/1.json
  def destroy
    @doctor_specialization.destroy
    respond_to do |format|
      format.html { redirect_to doctor_specializations_url, notice: 'Doctor specialization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_specialization
      @doctor_specialization = DoctorSpecialization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_specialization_params
      params.require(:doctor_specialization).permit(:name)
    end
end
