class ProfilesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @profiles = User.all  
  end
end
