class CoursesController < ApplicationController
  before_action(:set_course, only: %i(show edit))
  def index
    @courses = Course.all
  end

  def new
    @course = Courses::Create.new()
  end

  def create
    success = -> (course) { redirect_to(course_path(course), notice: 'success') }
    failure = -> (course) { @course = course; render(:new); puts course.errors.full_messages }

    CourseService::Create.(course_params, success: success, failure: failure)
  end

  def show
  end

  def edit
  end

  private
    def course_params
      params.require(:course).permit(:title, :desc, :price, :photo)
    end

    def set_course
      @course = Course.friendly.find(params[:id])
    end
end
