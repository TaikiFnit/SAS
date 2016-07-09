
class CoursesController < ApplicationController

  # require 'net/http'
  # require 'net/https'
  # require 'uri'

  before_action :authenticate_user!

  def resume

    @course = Course.find(params[:id])

    url = URI.parse(@course.resume);

    res = Net::HTTP.start(url.host, url.port) { |http|
      http.get(url.path)
    }

    @response = res.body

    render text: @response
  end

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
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params) then

      UserCourse.create(user_id: current_user.id, course_id: @course.id)

      redirect_to @course
    end
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :permission, :resume)
  end

end
