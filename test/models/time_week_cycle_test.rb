# == Schema Information
#
# Table name: time_week_cycles
#
#  id                       :integer          not null, primary key
#  activity_class_starts_at :datetime         not null
#  activity_class_ends_at   :datetime         not null
#  period_started_at        :date
#  period_ended_at          :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  activity_id              :integer          not null
#

require 'test_helper'

class TimeWeekCycleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
