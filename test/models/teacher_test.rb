# == Schema Information
#
# Table name: teachers
#
#  id                            :integer          not null, primary key
#  name                          :string(255)      default("")
#  surname                       :string(255)      default("")
#  work_email                    :string(255)      default("")
#  nic                           :string(255)
#  mobile_phone_number           :string(255)
#  phone_number                  :string(255)
#  address                       :string(255)
#  town                          :string(255)
#  province                      :string(255)
#  zip_code                      :string(255)
#  iban                          :string(255)
#  photo_file_name               :string(255)
#  photo_content_type            :string(255)
#  photo_file_size               :integer
#  photo_updated_at              :datetime
#  default_collection_management :boolean          default(FALSE), not null
#  default_attendance_management :boolean          default(FALSE), not null
#  studies                       :text(65535)
#  details                       :text(65535)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  user_id                       :integer
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
