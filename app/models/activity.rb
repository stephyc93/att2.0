class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :activities_students
  has_many :students, through: :activities_students

  geocoded_by :full_street_address
  after_validation :geocode

  private

  def full_street_address
  	self.location
  end

end
