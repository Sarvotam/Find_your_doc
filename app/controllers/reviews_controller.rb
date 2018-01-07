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
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        format.js

      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        # format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        # format.json { render :show, status: :ok, location: @review }
        format.js
      else
        format.js
        # format.html { render :edit }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
      format.js
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
