class StudentsController < ApplicationController
  def index
  end

  def show
  end

  def invite
  	byebug
  	
  	user = User.invite!(:email => "new_user@example.com", :name => "John Doe") do |u|
	  u.skip_invitation = true
	end
  end
end
