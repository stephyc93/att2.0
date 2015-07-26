class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :invitable, :registerable, :validatable, :validate_on_invite => false

  validates :fullname, :email, presence: true, on: :create

  after_create :create_associated_model

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
    elsif self.student?
      student = Student.create(:name => self.fullname, :user_id => self.id)
    else
      self.update_attributes(:student => '1')
      student = Student.create(:name => self.fullname, :user_id => self.id)
    end
  end
end
