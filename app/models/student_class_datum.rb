# == Schema Information
#
# Table name: student_class_data
#
#  id                          :integer          not null, primary key
#  attended                    :boolean
#  paid                        :boolean
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  activity_class_id           :integer          not null
#  student_activity_sign_up_id :integer          not null
#

class StudentClassDatum < ActiveRecord::Base

  belongs_to :activity_class
  belongs_to :student_activity_sign_up
  has_one :student, through: :student_activity_sign_up
  has_one :activity, through: :activity_class

  validates_presence_of :activity_class, :student_activity_sign_up
  validates_uniqueness_of :student_activity_sign_up, scope: :activity_class, allow_nil: true
  #validates_inclusion_of :attended, :paid, in: [true, false]
  validate :student_is_signed_for_class?

  def to_s
    "#{activity_class} - #{student}"
  end

  private
  def student_is_signed_for_class?
    invalid = false
    if self.student_activity_sign_up.present?
      if not self.student_activity_sign_up.signed_for?( self.activity_class.started_at )
        errors.add( :activity_class, :student_is_not_signed_for_class )
        invalid = true
      end
    end
    invalid
  end

end
