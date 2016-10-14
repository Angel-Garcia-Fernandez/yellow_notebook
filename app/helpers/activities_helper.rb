module ActivitiesHelper
  def construct_teacher_activity_helper
    @activity.teacher_activities.any? || @activity.teacher_activities.build( teacher_in_charge: true )
  end
end
