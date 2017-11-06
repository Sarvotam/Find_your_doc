class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
   before_action :check, only: [:index]
   before_action :doctor_authentication, except: [:index]
  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new   
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user_id= current_user.id

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def doctor_authentication
      if current_user.user_type == "patient"
        redirect_to root_path
      else
        if !current_user.doctor.nil?
          if current_user.doctor.profile_confirmation == false
            flash[:notice] = "wait wait"
            redirect_to doctors_path
          end
      end
    end
    end

    def check
      if !current_user.doctor.nil?
        if current_user.doctor.profile_confirmation === false
          return true
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def hait
      if current_user.user_type == "patient"
        redirect_to root_path
      else
    # Enable dr to signup their verification form (redirect_to new_doctor_path) and stop to enter in if full form is not filled by Dr account user.
       if !current_user.doctor.nil?
          redirect_to new_doctor_path
       end
    
    end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:professional_statement, :practicing_from, :profile_image, :certificate_image, :fax_number, :award )
    end
end
