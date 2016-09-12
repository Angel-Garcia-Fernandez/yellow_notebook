class Teacher < ActiveRecord::Base
  validates_uniqueness_of :name , scope: :surname#, conditions: { status: :active}
  validates_presence_of :asistencia, :cobros
  validates_inclusion_of :asistencia, :cobros, in: [ true, false ]
end
