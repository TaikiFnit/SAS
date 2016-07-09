class CoursesController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def show
    # TODO: そのユーザーのperrmissionを検査(そのcourseに属しているか調査)

    @course = Course.find(params[:id])

    @reply = Reply.new
    @message = Message.new
    @messages = Message.where(course_id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save then

      UserCourse.create(user_id: current_user.id, course_id: @course.id)

      redirect_to @course
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :permission, :resume)
  end

end
