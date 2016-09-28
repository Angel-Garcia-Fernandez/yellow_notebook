# == Schema Information
#
# Table name: school_representatives
#
#  id         :integer          not null, primary key
#  full_name  :string(255)      default(""), not null
#  position   :string(255)
#  details    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :integer          not null
#

require 'test_helper'

class SchoolRepresentativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
