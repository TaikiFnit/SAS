class JoinsController < ApplicationController

  def index
  end

  def new
    @join = Join.new
    @courses = Course.all
  end

  def create
    data = join_params
    data[:user_id] = current_user.id

    @join = Join.new(data)
    @join.save

    @user_course = UserCourse.new(data)
    @user_course.save

    redirect_to course_path(data[:course_id])
  end

  private

  def join_params
    params.require(:join).permit(:course_id)
  end

end
