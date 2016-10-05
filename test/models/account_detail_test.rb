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

require 'test_helper'

class AccountDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
