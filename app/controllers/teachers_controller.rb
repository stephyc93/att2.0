class TeachersController < ApplicationController
  def index
  end

  def show
  	activities = Activity.where :teacher_id => @current_teacher.id
  end
end
