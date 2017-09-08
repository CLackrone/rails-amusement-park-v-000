class AttractionsController < ApplicationController

  before_action :set_attraction, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
      @attraction = Attraction.new(attr_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to new_attraction_path
      end
  end

  def edit
    
  end

  def update
    @attraction.update(attr_params)
    if @attraction.save
      redirect_to @attraction
    else
      render edit_attraction_path
    end
  end








  def index
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @ride = Ride.new
  end

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attr_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
