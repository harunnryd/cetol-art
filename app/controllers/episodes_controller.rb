class EpisodesController < ApplicationController
  before_action(:authenticate_user!, except: %i(index show))
  before_action(:set_episode, only: %i(show edit update destroy))

  def index
    @episodes = Episode.all.paginate(page: params[:page], per_page: 15)
  end

  def new
    authorize(Episode)
    @episode = Episodes::Create.new()
    @course_list = Course.where(user_id: current_user.id)
  end

  def create
    success = -> (episode) { redirect_to(episode_path(episode), notice: 'success') }
    failure = -> (episode) do
      @episode = episode
      @course_list = Course.where(user_id: current_user.id)
      render(:new)
    end

    authorize(Episode)
    EpisodeService::Create.(current_user, episode_params, success: success, failure: failure)
  end

  def update
    success = -> (episode) { redirect_to(episode_path(episode), notice: 'success') }
    failure = -> (episode) do
      @course_list = Course.where(user_id: current_user.id)
      @episode = episode
      render(:edit)
    end

    authorize(@episode)
    EpisodeService::Update.(current_user, @episode, episode_params, success: success, failure: failure)
  end

  def show
  end

  def edit
    @course_list = Course.where(user_id: current_user.id)
    authorize(@episode)
  end

  def destroy
    authorize(@episode)
    redirect_to(episodes_path) if @episode.destroy
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :url, :duration, :desc, :course_id)
    end

    def set_episode
      @episode = Episode.friendly.find(params[:id])
      @course = @episode.course
    end
end
