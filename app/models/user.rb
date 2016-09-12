class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable ,
         :rememberable, :registerable, :trackable

  validates_uniqueness_of :login
end
