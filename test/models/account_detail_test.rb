# == Schema Information
#
# Table name: account_details
#
#  id         :integer          not null, primary key
#  IBAN       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AccountDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
