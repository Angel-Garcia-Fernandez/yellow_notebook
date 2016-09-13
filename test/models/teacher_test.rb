# == Schema Information
#
# Table name: teachers
#
#  id                        :integer          not null, primary key
#  name                      :string(255)      default("")
#  surname                   :string(255)      default("")
#  manage_attendance_default :boolean          default(FALSE), not null
#  manage_collection_default :boolean          default(FALSE), not null
#  details                   :text(65535)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
