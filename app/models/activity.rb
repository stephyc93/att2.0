class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :activities_students
  has_many :students, through: :activities_students

  validate do
    errors.add(:base, 'You must provide a start and end date.') unless self.end.present? && self.start.present?
    errors.add(:base, 'All fields are required.') unless self.location.present? && self.name.present? && self.description.present?
  end

  validate :must_be_on_the_same_day
  validate :must_have_correct_times

  def must_be_on_the_same_day
    if self.start.to_date != self.end.to_date
      errors.add(:base, 'Start and End Dates must be on the same day.')
    end
  end

  def must_have_correct_times
    if self.end.to_time < self.start.to_time
      errors.add(:base, 'You can not have an end date before a start date.')
    end
  end

  geocoded_by :full_street_address
  after_validation :geocode

  include PgSearch #adds search functionality
  pg_search_scope :search_by_activity, :against => [:name, :description] #search against these two columns

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
