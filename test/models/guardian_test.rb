# == Schema Information
#
# Table name: guardians
#
#  id           :integer          not null, primary key
#  NIC          :string(255)      default(""), not null
#  name         :string(255)      default(""), not null
#  surname      :string(255)      default(""), not null
#  phone_number :string(255)
#  address      :string(255)
#  town         :string(255)
#  province     :string(255)
#  zip_code     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :integer          not null
#

require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
