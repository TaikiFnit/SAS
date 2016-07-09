class Course < ActiveRecord::Base
  has_many :user_courses
  has_many :users, through: :user_courses

end
