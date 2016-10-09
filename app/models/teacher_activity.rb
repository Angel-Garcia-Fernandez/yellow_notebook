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
  validate :one_and_only_one_default
  validates_uniqueness_of :teacher, scope: :activity, allow_nil: true

  after_save :destroy_nils

  scope :teachers_in_charge, -> { where( teacher_in_charge: true ) }


  private
  def one_and_only_one_default
    invalid = false
    teachers_for_this_activity = TeacherActivity.where( activity: activity)
    if teachers_for_this_activity.size > 0
      if teachers_for_this_activity.teachers_in_charge.size != 1
        errors.add( :base, :one_default )
        invalid = true
      end
    end
    invalid
  end

  def destroy_nils
    if teacher.nil? or activity.nil?
      self.destroy
    end
  end

end
