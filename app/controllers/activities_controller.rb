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
    params[:activity][:start] = DateTime.strptime(params[:activity][:start],'%m/%d/%Y %I:%M %p')
    params[:activity][:end] = DateTime.strptime(params[:activity][:end],'%m/%d/%Y %I:%M %p')
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
    params[:activity][:start] = DateTime.strptime(params[:activity][:start],'%m/%d/%Y %I:%M %p')
    params[:activity][:end] = DateTime.strptime(params[:activity][:end],'%m/%d/%Y %I:%M %p')
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

  def student_sign_up
    @activity = Activity.find params[:activity_id]
    @activity.students << @current_student
    flash[:notice] = "You have signed up for the event"
    redirect_to :back
  end

  def choose_students
     @students = Student.all
  end

  def add_students
    # Activities_students.new(student_id: )



    # @student = Student.find_by[:id params[:student_id]]
    # if @student.save
    #   redirect_to activity_path
    # else
    #   render :choose_students
    # end
  end

  private

    def find_activity
      @activity = Activity.find_by(id: params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :start, :end, :permission_slip)
    end

end
