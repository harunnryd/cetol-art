module EpisodeService
  class Update
    def self.call(user, episode, attrs, callbacks)
      new(user, episode, attrs, callbacks).call
    end

    def call
      form = Episodes::Update.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        obj = episode
        obj.user = user
        obj.course_id = form.course_id
        obj.desc = form.desc
        obj.title = form.title
        obj.url = form.url
        obj.duration = form.duration
        if obj.save
          return callbacks[:success].call(obj)
        end
      end
    end

    private
      attr_reader(:user, :episode, :attrs, :callbacks)
      def initialize(user, episode, attrs, callbacks)
        @user = user
        @episode = episode
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
