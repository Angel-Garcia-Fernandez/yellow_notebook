# == Schema Information
#
# Table name: student_activity_sign_ups
#
#  id                :integer          not null, primary key
#  activity_discount :decimal(5, 4)
#  started_at        :date
#  ended_at          :date
#  payment_type_eid  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  activity_id       :integer          not null
#  student_id        :integer          not null
#

class StudentActivitySignUp < ActiveRecord::Base

  belongs_to :activity
  belongs_to :student

end
