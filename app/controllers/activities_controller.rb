class ActivitiesController < ApplicationController
  require 'time'
  before_action :find_activity, only:[:show, :edit, :update, :destroy]
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    params[:start] = DateTime.strptime(params[:start],'%m/%d/%Y %I:%M %p')
    params[:end] = DateTime.strptime(params[:end],'%m/%d/%Y %I:%M %p')
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    params[:start] = DateTime.strptime(params[:activity][:start],'%m/%d/%Y %I:%M %p')
    params[:end] = DateTime.strptime(params[:activity][:end],'%m/%d/%Y %I:%M %p')
    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render :edit
    end
  end

  def destroy
    if @activity.destroy
      redirect_to activities_path
    else
       flash[:notice] = "Something went wrong Data not deleted"
    end
  end

  private
  def find_activity
    @activity = Activity.find_by(id: params[:id])
  end

  def activity_params
    params.permit(:name, :start, :end, :permission_slip)
  end

end
