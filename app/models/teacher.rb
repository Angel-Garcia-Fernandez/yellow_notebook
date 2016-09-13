# == Schema Information
#
# Table name: teachers
#
#  id                        :integer          not null, primary key
#  name                      :string(255)      default("")
#  surname                   :string(255)      default("")
#  manage_attendance_default :boolean          default(FALSE), not null
#  manage_collection_default :boolean          default(FALSE), not null
#  details                   :text(65535)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Teacher < ActiveRecord::Base
  validates_uniqueness_of :name , scope: :surname#, conditions: { status: :active}
  validates_presence_of :asistencia, :cobros
  validates_inclusion_of :asistencia, :cobros, in: [ true, false ]
end
