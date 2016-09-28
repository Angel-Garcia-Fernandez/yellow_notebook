# == Schema Information
#
# Table name: teacher_activities
#
#  id                    :integer          not null, primary key
#  attendance_management :boolean          default(FALSE), not null
#  collection_management :boolean          default(FALSE), not null
#  teacher_in_charge     :boolean          default(TRUE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  activity_id           :integer          not null
#  teacher_id            :integer          not null
#

class TeacherActivity < ActiveRecord::Base

  belongs_to :activity
  belongs_to :teacher

  validates_inclusion_of :collection_management, :attendance_management, :teacher_in_charge, in: [true, false]
  validate :one_default

  scope :default_account, -> { where( default_account: true ) }

  private
  def one_default
    invalid = false
    student_accounts = TeacherActivity.where( activity: activity)
    if student_accounts.size > 0
      if student_accounts.default_account.size != 1
        errors.add( :base, :one_default )
        invalid = true
      end
    end
    invalid
  end

end
