module EpisodeService
  class Create
    def self.call(user, attrs, callbacks)
      new(user, attrs, callbacks).call
    end

    def call
      form = Episodes::Create.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        episode = Episode.new
        episode.user = user
        episode.course_id = form.course_id
        episode.desc = form.desc
        episode.title = form.title
        episode.url = form.url
        episode.duration = form.duration
        if episode.save
          return callbacks[:success].call(episode)
        end
      end
    end

    private
      attr_reader(:user, :attrs, :callbacks)
      def initialize(user, attrs, callbacks)
        @user = user
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
