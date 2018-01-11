module CourseService
  class Create
    def self.call(attrs, callbacks)
      new(attrs, callbacks).call
    end

    def call
      form = Courses::Create.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        course = Course.new(form.attrs)
        if course.save
          return callbacks[:success].call(course)
        end
      end
    end

    private
      attr_reader(:attrs, :callbacks)
      def initialize(attrs, callbacks)
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
