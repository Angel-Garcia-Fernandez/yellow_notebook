class CreateAttendanceSumaries < ActiveRecord::Migration
  def up
    self.connection.execute %Q( CREATE OR REPLACE VIEW attendance_sumaries AS
            SELECT
              act.id as activity_id,
              sch.id as school_id,
              stu.id as student_id,
              dat.id as student_class_data_id,
              cla.id as activity_class_id,
              dat.attended
            from
              activities act inner join
              student_activity_sign_ups sig on sig.activity_id = act.id inner join
              students stu on sig.student_id = stu.id left join
              schools sch on act.school_id = sch.id inner join
              activity_class cla on cla.activity_id = act.id left join
              student_class_data dat on sig.id = dat.student_activity_sign_up_id;
          )
  end

  def down
    self.connection.execute "DROP VIEW IF EXISTS attendance_sumaries;"
  end

end
