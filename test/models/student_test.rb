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
#  account_holder_nic   :string(255)
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
