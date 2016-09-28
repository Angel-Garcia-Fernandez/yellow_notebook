# == Schema Information
#
# Table name: teacher_activities
#
#  id                    :integer          not null, primary key
#  attendance_management :boolean          default(FALSE), not null
#  collection_management :boolean          default(FALSE), not null
#  teacher_in_charge     :boolean          default(TRUE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  activity_id           :integer          not null
#  teacher_id            :integer          not null
#

require 'test_helper'

class TeacherActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
