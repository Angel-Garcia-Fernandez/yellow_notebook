# == Schema Information
#
# Table name: student_class_data
#
#  id                          :integer          not null, primary key
#  attended                    :boolean          default(FALSE)
#  paid                        :boolean          default(FALSE)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  activity_class_id           :integer          not null
#  student_activity_sign_up_id :integer          not null
#

class StudentClassDatum < ActiveRecord::Base

  belongs_to :activity_class
  belongs_to :student_activity_sign_up

  validates_presence_of :activity_class, :student_activity_sign_up
  validates_inclusion_of :attended, :paid, in: [true, false]

end
