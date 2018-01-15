class EpisodesController < ApplicationController
  before_action(:authenticate_user!, except: %i(index show))
  before_action(:set_episode, only: %i(show edit update destroy))

  def index
    @episodes = Episode.all
  end

  def new
    authorize(Episode)
    @episode = Episodes::Create.new()
  end

  def create
    success = -> (episode) { redirect_to(episode_path(episode), notice: 'success') }
    failure = -> (episode) { @episode = episode; render(:new); puts episode.errors.full_messages }

    authorize(Episode)
    EpisodeService::Create.(current_user, episode_params, success: success, failure: failure)
  end

  def update
    success = -> (episode) { redirect_to(episode_path(episode), notice: 'success') }
    failure = -> (episode) { @episode = episode; render(:edit); puts episode.errors.full_messages }

    authorize(@episode)
    EpisodeService::Update.(current_user, @episode, episode_params, success: success, failure: failure)
  end

  def show
  end

  def edit
    authorize(@episode)
  end

  def destroy
    authorize(@episode)
    redirect_to(episodes_path) if @episode.destroy
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :url, :duration, :course_id)
    end

    def set_episode
      @episode = Episode.friendly.find(params[:id])
      @course = @episode.course
    end
end
