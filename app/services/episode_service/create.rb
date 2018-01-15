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
        course = Episode.new
        course.user = user
        course.title = form.title
        course.url = form.url
        course.duration = form.duration
        if course.save
          return callbacks[:success].call(course)
        end
      end
    end

    private
      attr_reader(:user, attrs, :callbacks)
      def initialize(user, attrs, callbacks)
        @user = user
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
