class TeachersController < ApplicationController
  def index
  	@activity = Activity.new
  end

  def show
  	@activities = Activity.where :teacher_id => @current_teacher.id
    @activities_students = Activity.last.activities_students
    @student = Student.all
  end
end
