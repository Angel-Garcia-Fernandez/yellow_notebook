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
  has_many :student_class_data

  before_validation :build_student_class_data

  #validates_presence_of :activity, :student # no hace falta por el destroy_nils
  validates_uniqueness_of :student, scope: :activity, allow_nil: true
  validates_presence_of :activity_discount, :payment_type
  validates_inclusion_of :payment_type, in: payment_types.keys
  validates_numericality_of  :activity_discount, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0

  after_save :destroy_nils

  scope :starts_before, -> ( date = DateTime.current ) { where( "student_activity_sign_ups.started_at <= ?", date ) }
  scope :ends_after, -> ( date = DateTime.current ) { where( "student_activity_sign_ups.ended_at >= ?", date ) }
  scope :signed_for, -> ( activities, date = DateTime.current ) {
    where( activity: activities ).joins( :activity ).merge( Activity.on_going( date ) ).
    merge( self.where.any_of( {started_at: nil}, starts_before( date ) ) ).
    merge( self.where.any_of( { ended_at: nil }, ends_after( date ) ) ) }


  def build_student_class_data
    self.activity.activity_classes.each do |c|
      if not c.student_class_data.find_by( student_activity_sign_up: self ).any?
        self.student_class_data.build( activity_class: c ) #necesito el accepts_nested_attributes??
      end
    end
  end

  private

  def destroy_nils
    if student.nil? or activity.nil?
      self.destroy
    end
  end
end
