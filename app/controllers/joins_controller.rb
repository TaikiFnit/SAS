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

    result = UserCourse.where(['user_id = ? and course_id = ?', data[:user_id], data[:course_id]])

    # 重複して参加しないようにする処理
    if(result.count == 0) then
      @user_course = UserCourse.new(data)
      @user_course.save
    end

    redirect_to course_path(data[:course_id])
  end

  private

  def join_params
    params.require(:join).permit(:course_id)
  end

end
