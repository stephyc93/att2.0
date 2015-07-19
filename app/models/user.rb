class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :invitable, :registerable
  after_create :override_confirmable_email
    
  def override_confirmable_email
    self.confirmed_at = DateTime.current
    self.save
  end
end
