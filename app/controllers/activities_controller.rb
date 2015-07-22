class ActivitiesController < ApplicationController
  
  require 'time'

  before_action :find_activity, only:[:show, :edit, :update, :destroy, :attendance]

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

  # def confirmjob
  #   @job = Job.find(params[:id])
  #   @job.employments.update_attributes(:confirmed, 1)
  #   flash[:notice] = "Job Confirmed"
  #   redirect_to :dashboard
  # end

  def attendance
    @activity = Activity.find params[:id]
    @activity.students.update_attributes(:attendance, 1)
    flash[:notice] = "attendance taken"
    redirect_to teacher_path
#       <input type="checkbox" id="post_validate" name="post[validated]"
#                                    value="1" checked="checked" />
# <input name="post[validated]" type="hidden" value="0" />

#       <input type="hidden"   name="model[attr]" value="0" />
# <input type="checkbox" name="model[attr]" value="1" />

# <%= hidden_field_tag 'model_name[column_name]', '0' %>
# <%= check_box_tag 'model_name[column_name]', 1, (@data.model_name.column_name == 1 ? true : false) %>

  end

  def choose_students
    activity_id = params[:activity_id]
    @students = Student.all
    # @students = Student.without_activity_enrollment(activity_id)
    # binding.pry
  end

  def remove_student
    @student_id = params[:student_id]
    @activity_student = ActivityStudent.find_by(activity_id: params[:activity_id], student_id: @student_id)
    
    if @activity_student.destroy
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:warning] = 'Unenrollment failed!'
      render :choose_students
    end
  end

  def add_student
    # byebug
    @student_id = params[:student_id]
    enrollment = ActivityStudent.new(activity_id: params[:activity_id], 
                                      student_id: @student_id)

    if enrollment.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:warning] = 'Enrollment failed!'
      render :choose_students
    end
  end



  private

    def find_activity
      @activity = Activity.find_by(id: params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :start, :end, :permission_slip, :attendance)
    end

end
