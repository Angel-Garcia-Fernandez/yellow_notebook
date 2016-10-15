# == Schema Information
#
# Table name: students
#
#  id                   :integer          not null, primary key
#  name                 :string(255)      default("")
#  surname              :string(255)      default("")
#  nic                  :string(255)
#  default_discount     :decimal(5, 4)    default(0.0), not null
#  default_payment_type :integer          default(0), not null
#  scholar_phone_number :string(255)
#  phone_number         :string(255)
#  address              :string(255)
#  town                 :string(255)
#  province             :string(255)
#  zip_code             :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  details              :text(65535)
#  school_id            :integer
#  iban                 :string(255)
#  account_holder       :string(255)
#

class Student < ActiveRecord::Base
  include Enum_I18n
  enum default_payment_type: [ :cash, :bank_transfer ]

  has_many :student_activity_sign_ups
  has_many :activities, through: :student_activity_sign_ups
  has_many :guardians
  has_many :account_details
  belongs_to :school

  accepts_nested_attributes_for :student_activity_sign_ups, allow_destroy: true, reject_if: proc { |attributes| attributes['activity_id'].blank? }

  validates_length_of :name, :surname, :nic, :scholar_phone_number, :phone_number, :address, :town,
                      :province, :zip_code, :account_holder, maximum: 255
  validates_presence_of :default_discount, :default_payment_type
  validates_numericality_of  :default_discount, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0, allow_nil: true
  #validates_uniqueness_of :name, scope: [ :surname ], if: 'nic.blank?'
  validates_uniqueness_of :nic, allow_blank: true, allow_nil: true
  validates_length_of :iban, maximum: 75
  validates_inclusion_of :default_payment_type, in: default_payment_types.keys
  validates_associated :student_activity_sign_ups


  def to_s
    "#{name} #{surname}"
  end

end
