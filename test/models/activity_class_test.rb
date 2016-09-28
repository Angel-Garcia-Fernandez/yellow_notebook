# == Schema Information
#
# Table name: activity_classes
#
#  id          :integer          not null, primary key
#  started_at  :datetime         not null
#  ended_at    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer          not null
#

require 'test_helper'

class ActivityClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
