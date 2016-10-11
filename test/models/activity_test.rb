# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  classification :string(255)
#  started_at     :date
#  ended_at       :date
#  default_price  :decimal(8, 2)
#  details        :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  school_id      :integer
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
