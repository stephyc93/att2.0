class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :invitable, :registerable

  after_save :create_associated_model

  def override_confirmable_email
    self.confirmed_at = DateTime.current
    self.save
  end

  private

  def create_associated_model
  	if self.parent?
      parent = Parent.create(:name => self.fullname, :user_id => self.id)
    elsif self.teacher?
      teacher = Teacher.create(:name => self.fullname, :user_id => self.id)
      student = Student.create(:name => self.fullname, :user_id => self.id)
    elsif self.student?
    else
      self.update_attributes(:teacher => '1')
      student = Student.create(:name => self.fullname, :user_id => self.id)
    end
  end
end
