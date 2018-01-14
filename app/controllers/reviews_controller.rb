class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    before_action :specific_user, only: [:show, :edit, :update, :destroy ]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all   
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new

  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    if @review = Review.new(review_params)
       flash[:notice] = "New Review for doctor successfully created"
    end
    @review.user_id = current_user.id
    doctor_id = review_params[:doctor_id]
     if @review.save 
      doctor_id = Doctor.find(review_params[:doctor_id])
      @average_review = (doctor_id.reviews.average(:wait_time_rating) + doctor_id.reviews.average(:bedside_manner_rating) + doctor_id.reviews.average(:overall_rating))/3           

      flash[:notice] = "successfully created"
    else
      flash[:notice] = "failed"
    end
    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      flash[:notice] = "Review Updated"
    else
      flash[:notice] = "Review failed to update"
    end
       
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    if@review.destroy
      flash[:notice] = "Review successfully deleted"
    else
      flash[:notice] = "Review failed to delete"
    end
  end

  private


   def specific_user
     if current_user.id != @review.user_id
      flash[:notice] = "You are not the right user"
      redirect_to root_path
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:wait_time_rating, :bedside_manner_rating, :overall_rating, :review, :is_recommended, :doctor_id)
    end
end
