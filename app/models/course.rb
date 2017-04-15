class Course < ActiveRecord::Base
  #Relations
  has_many :activities
  has_many :students, through: :activities, inverse_of: :course
  has_many :schools, through: :activities, inverse_of: :course
  has_many :teachers, through: :activities, inverse_of: :course

  #Validations
  validates_uniqueness_of :name

  #Public_Methods
  def to_s
    name.to_s
  end

end