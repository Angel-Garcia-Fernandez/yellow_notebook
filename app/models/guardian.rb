# == Schema Information
#
# Table name: guardians
#
#  id           :integer          not null, primary key
#  NIC          :string(255)
#  name         :string(255)
#  surname      :string(255)
#  phone_number :string(255)
#  address      :string(255)
#  town         :string(255)
#  province     :string(255)
#  zip_code     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Guardian < ActiveRecord::Base
end
