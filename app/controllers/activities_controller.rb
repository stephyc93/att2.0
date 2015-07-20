class ActivitiesController < ApplicationController
  before_action :find_activity, only:[:show, :edit, :update, :destroy]
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @activity.destroy
      redirect_to root_path
    else
       flash[:notice] = "Something went wrong Data not deleted"
    end
  end

  private
  def find_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :date, :time, :location, :permission_slip)
  end
end
