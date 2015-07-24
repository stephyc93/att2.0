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
    params[:activity][:permission_slip] = params[:permission_slip]
    params[:activity][:teacher_id] = @current_teacher.id

    if params[:activity][:end] < params[:activity][:start]
      flash[:warning] = "You can't have an end date before a start date."
      return redirect_to :back

    end
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def show
    @activity = Activity.find params[:id]
  end

  def edit
  end

  def update
    params[:activity][:start] = DateTime.strptime(params[:activity][:start],'%m/%d/%Y %I:%M %p')
    params[:activity][:end] = DateTime.strptime(params[:activity][:end],'%m/%d/%Y %I:%M %p')
    params[:activity][:permission_slip] = params[:permission_slip]
    params[:activity][:teacher_id] = @current_teacher.id
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
       flash[:success] = "Something went wrong Data not deleted"
    end
  end

  def confirmAttendance
    @activity = Activity.find(params[:activity_id])
    @student = Student.find params[:student_id]
    present = @student.activities_students.where( :activity_id => params[:activity_id]).first.attendance.first.to_i
    present = present == 1 ? 0 : 1
    ActivitiesStudent.confirm!(@activity.id, params[:student_id], present)

    flash[:success] = "#{@student.name} confirmed at the event."
    redirect_to :back
  end

  def student_sign_up
    @activity = Activity.find params[:activity_id]
    if @activity.students.exists? @current_student.id
      @activity.students.delete(@current_student)
      flash[:success] = "You have removed yourself from the event."
    else
      flash[:success] = "You have signed up for the event"
      @activity.students << @current_student
    end

    redirect_to :back
  end

  def attendance
    @activity = Activity.find params[:id]
    @activity.students.update_attributes(:attendance, 1)
    flash[:success] = "attendance taken"
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
  end

  def remove_student
    @student_id = params[:student_id]
    @activities_student = ActivitiesStudent.find_by(activity_id: params[:activity_id], student_id: @student_id)

    if @activities_student.destroy
      flash[:success] = 'Student successfully removed!'
      return redirect_to :back
    else
      flash[:warning] = 'Unenrollment failed!'
      render :choose_students
    end
  end

  def add_student

    @student_id = params[:student_id]
    enrollment = ActivitiesStudent.new(activity_id: params[:activity_id],
                                      student_id: @student_id)

    if enrollment.save
      flash[:success] = 'Student successfully added!'
      return redirect_to choose_students_path(params[:activity_id])
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
      params.require(:activity).permit(:name, :start, :end, :permission_slip, :location, :description, :teacher_id, :attendance)
    end

end
