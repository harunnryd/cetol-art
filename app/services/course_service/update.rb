module CourseService
  class Update
    def self.call(user, course, attrs, callbacks)
      new(user, course, attrs, callbacks).call
    end

    def call
      form = Courses::Update.(attrs)
      if form.invalid?
        return callbacks[:failure].call(form)
      else
        obj = course
        obj.user = user
        obj.title = form.title
        obj.desc = form.desc
        obj.price = form.price
        obj.photo = form.photo if form.photo.present?
        if obj.save
          return callbacks[:success].call(obj)
        end
      end
    end

    private
      attr_reader(:user, :course, :attrs, :callbacks)
      def initialize(user, course, attrs, callbacks)
        @user = user
        @course = course
        @attrs = attrs
        @callbacks = callbacks
      end
  end
end
