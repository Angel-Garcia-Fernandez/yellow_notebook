# == Schema Information
#
# Table name: student_class_data
#
#  id                          :integer          not null, primary key
#  attended                    :boolean          default(FALSE)
#  paid                        :boolean          default(FALSE)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  activity_class_id           :integer          not null
#  student_activity_sign_up_id :integer          not null
#

require 'test_helper'

class StudentClassDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
