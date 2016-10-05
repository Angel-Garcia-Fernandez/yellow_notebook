# == Schema Information
#
# Table name: account_details
#
#  id              :integer          not null, primary key
#  iban            :string(255)
#  default_account :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  guardian_id     :integer
#  student_id      :integer          not null
#

class AccountDetail < ActiveRecord::Base

  belongs_to :student
  belongs_to :guardian

  validates_presence_of :student, :iban, :default_account
  validates_length_of :iban, maximum: 75
  validate :one_default

  scope :default_account, -> { where( default_account: true ) }

  private
  def one_default
    invalid = false
    student_accounts = AccountDetail.where( student: student )
    if student_accounts.size > 0
      if student_accounts.default_account.size != 1
        errors.add( :default_account, :one_default )
        invalid = true
      end
    end
    invalid
  end

end
