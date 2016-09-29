class TeacherUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :teacher

  #validates_presence_of :user, :teacher
  validates_uniqueness_of :user, :teacher, allow_nil: true

  after_save :destroy_nils

  def destroy_nils
    if user.nil or teacher.nil
      self.destroy
    end
  end

end
