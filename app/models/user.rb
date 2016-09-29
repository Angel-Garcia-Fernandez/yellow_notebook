# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  login               :string(255)      default(""), not null
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable ,
         :rememberable, :registerable, :trackable

  has_one :teacher_user
  has_one :teacher, through: :teacher_user

  accepts_nested_attributes_for :teacher_user

  validates_uniqueness_of :login
  validates_associated :teacher_user

  def to_s
    login.to_s
  end

  # def initialize attributes = nil, options = {}
  #   super attributes, options
  #   self.teacher_user.nil? && self.build_teacher_user
  #   self
  # end

end
