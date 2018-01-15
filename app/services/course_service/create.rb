module CourseService
  class Create
    def self.call(user, attrs, callbacks)
      new(user, attrs, callbacks).call
    end

    def call
      form = Courses::Create.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        course = Course.new
        course.user = user
        course.title = form.title
        course.desc = form.desc
        course.price = form.price
        course.photo = form.photo
        if course.save
          return callbacks[:success].call(course)
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
