class TimeSchedulesController < ApplicationController
  before_action :set_time_schedule, only: [:show, :edit, :update, :destroy]
  before_action :doctor_authentication, except: [:index]

  # GET /time_schedules
  # GET /time_schedules.json
  def index
    @time_schedules = TimeSchedule.all
  end

  # GET /time_schedules/1
  # GET /time_schedules/1.json
  def show
  end

  # GET /time_schedules/new
  def new
    @time_schedule = TimeSchedule.new
  end

  # GET /time_schedules/1/edit
  def edit
  end

  # POST /time_schedules
  # POST /time_schedules.json
  def create
    @time_schedule = TimeSchedule.new(time_schedule_params)

    respond_to do |format|
      if @time_schedule.save
        format.html { redirect_to @time_schedule, notice: 'Time schedule was successfully created.' }
        format.json { render :show, status: :created, location: @time_schedule }
      else
        format.html { render :new }
        format.json { render json: @time_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_schedules/1
  # PATCH/PUT /time_schedules/1.json
  def update
    respond_to do |format|
      if @time_schedule.update(time_schedule_params)
        format.html { redirect_to @time_schedule, notice: 'Time schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_schedule }
      else
        format.html { render :edit }
        format.json { render json: @time_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_schedules/1
  # DELETE /time_schedules/1.json
  def destroy
    @time_schedule.destroy
    respond_to do |format|
      format.html { redirect_to time_schedules_url, notice: 'Time schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_schedule
      @time_schedule = TimeSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_schedule_params
      params.fetch(:time_schedule, {})
    end
end
