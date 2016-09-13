# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  code           :string(255)
#  name           :string(255)
#  classification :string(255)
#  started_at     :date
#  ended_at       :date
#  default_price  :decimal(8, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
