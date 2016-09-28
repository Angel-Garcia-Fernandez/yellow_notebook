# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  address    :string(255)
#  town       :string(255)
#  province   :string(255)
#  zip_code   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
