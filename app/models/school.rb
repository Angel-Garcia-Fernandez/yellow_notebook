# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  town       :string(255)
#  province   :string(255)
#  zip_code   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ActiveRecord::Base
end
