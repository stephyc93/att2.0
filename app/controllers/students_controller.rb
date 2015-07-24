class StudentsController < ApplicationController
  def index
    @students = Student.all
    @activities = Activity.all
  end

  def show
  end

  def invite
  	user = User.invite!(:email => params[:email], :fullname => params[:name]) do |u|
  	   u.skip_invitation = false
  	end

    flash[:success] = "Invitation has been sent!"
    redirect_to :back

  end
end
