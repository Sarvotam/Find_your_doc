class ProfilesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @profiles = current_user.qualifications.all  
  end
end
