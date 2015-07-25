class TeachersController < ApplicationController
  def index
  	@activity = Activity.new
  end

  def show
  	@activities = Activity.where :teacher_id => @current_teacher.id
    @activities_students = ActivitiesStudent.all
    @student = Student.all
  end

  def invite_student
  end
end
