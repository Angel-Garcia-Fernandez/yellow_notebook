# == Schema Information
#
# Table name: student_activity_sign_ups
#
#  id                :integer          not null, primary key
#  activity_discount :decimal(5, 4)    default(0.0), not null
#  started_at        :date
#  ended_at          :date
#  payment_type      :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  activity_id       :integer          not null
#  student_id        :integer          not null
#

class StudentActivitySignUp < ActiveRecord::Base
  include Enum_I18n
  enum payment_type: [ :cash, :bank_transfer ]

  belongs_to :activity
  belongs_to :student

  validates_uniqueness_of :student, scope: :activity, allow_nil: true
  validates_presence_of :activity_discount, :payment_type
  validates_inclusion_of :default_payment_type, in: payment_types.keys
  validates_numericality_of  :activity_discount, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0


  after_save :destroy_nils

  private

  def destroy_nils
    if student.nil? or activity.nil?
      self.destroy
    end
  end
end
