class DoctorsController < ApplicationController
  include DoctorsHelper
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :doctor, only: [:new, :create]
  before_action :doctor_authentication, except: [:show, :index]
  before_action :specific_user, only: [ :edit, :update, :destroy ]


  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.where(profile_confirmation: true) #views of the doc profile only if confirmed
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @review = Review.new
    @reviews = @doctor.reviews
    @qualification = @doctor.qualification  
        if @doctor.reviews.blank?
          @average_review = 0
        else
           @average_review = (@doctor.reviews.average(:wait_time_rating) + @doctor.reviews.average(:bedside_manner_rating) + @doctor.reviews.average(:overall_rating))/3           
        end   
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
    # binding.pry
    @doctor = current_user.doctor.update_attributes(professional_statement: params[:doctor][:professional_statement], practicing_from: params[:doctor][:practicing_from], profile_image: params[:doctor][:profile_image], certificate_image: params[:doctor][:certificate_image], fax_number: params[:doctor][:fax_number])
    redirect_to doctors_path
    # respond_to do |format|
    #   if @doctor.save
    #     format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
    #     format.json { render :show, status: :created, location: @doctor }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @doctor.errors, status: :unprocessable_entity }
    #   end
    # end
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


   def specific_user
     if session[:doctor_id] != @doctor.id
      flash[:notice] = "You are not the right user"
      redirect_to doctor_path(session[:doctor_id]) 
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:professional_statement, :practicing_from, :profile_image, :certificate_image, :fax_number, :award )
    end

    
end
