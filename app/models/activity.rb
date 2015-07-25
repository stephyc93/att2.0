class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :activities_students
  has_many :students, through: :activities_students

  geocoded_by :full_street_address
  after_validation :geocode

  def is_current?
  	return true if self.start.to_date <= Date.today.to_date && self.end.to_date >= Date.today.to_date
  end

  def is_future?
  	return true if self.start.to_date > Time.now.to_date
  end

  private

  def full_street_address
  	self.location
  end

end
