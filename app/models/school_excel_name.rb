class SchoolExcelName < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :name
  validates_uniqueness_of :name
end