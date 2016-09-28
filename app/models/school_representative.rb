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

class SchoolRepresentative < ActiveRecord::Base

  belongs_to :school

  validates_presence_of :full_name
  validates_uniqueness_of :full_name, scope: :school
  validates_length_of :full_name, :position, maximum: 255

end
