# == Schema Information
#
# Table name: activity_classes
#
#  id          :integer          not null, primary key
#  started_at  :datetime         not null
#  ended_at    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer          not null
#

class ActivityClass < ActiveRecord::Base

  belongs_to :activity
  has_many :student_class_data

  validates_presence_of :activity, :started_at, :ended_at

end
