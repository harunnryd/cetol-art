module EpisodeService
  class Update
    def self.call(episode, attrs, callbacks)
      new(episode, attrs, callbacks).call
    end

    def call
      form = Episodes::Update.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        obj = episode
        obj.title = form.title
        obj.url = form.url
        obj.duration = form.duration
        if obj.save
          return callbacks[:success].call(obj)
        end
      end
    end

    private
      attr_reader(:episode, :attrs, :callbacks)
      def initialize(episode, attrs, callbacks)
        @episode = episode
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
