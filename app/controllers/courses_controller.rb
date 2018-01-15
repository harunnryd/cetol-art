class CoursesController < ApplicationController
  before_action(:authenticate_user!, except: %i(index show))
  before_action(:set_course, only: %i(show edit update destroy))

  def index
    @courses = Course.all
  end

  def new
    authorize(Course)
    @course = Courses::Create.new()
  end

  def create
    success = -> (course) { redirect_to(course_path(course), notice: 'success') }
    failure = -> (course) { @course = course; render(:new) }
    authorize(Course)
    CourseService::Create.(current_user, course_params, success: success, failure: failure)
  end

  def update
    success = -> (course) { redirect_to(course_path(course), notice: 'success') }
    failure = -> (course) { @course = course; render(:edit) }
    authorize(@course)
    CourseService::Update.(current_user, @course, course_params, success: success, failure: failure)
  end

  def show
    @episodes = @course.episodes.paginate(page: params[:page], per_page: 15)
  end

  def edit
    authorize(@course)
  end

  def destroy
    authorize(@course)
    redirect_to(courses_path) if @course.destroy
  end

  private
    def course_params
      params.require(:course).permit(:title, :desc, :price, :photo)
    end

    def set_course
      @course = Course.friendly.find(params[:id])
    end
end
