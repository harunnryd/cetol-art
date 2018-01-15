module Episodes
  class Create < FormObject
    attr_reader(:attrs)
    attr_accessor(:title, :url, :desc, :duration, :course_id)

    def self.call(attrs = {})
      new(attrs)
    end

    def self.method_missing(name, *args)
      result =  "undefined method :#{name}"
      result.concat(" ", "with argument (#{args.join(',')})") if args.present?
      result
    end

    validates :title, :url, :duration, :desc, :course_id, presence: true
    validates_associated :course

    private
      def initialize(attrs = {})
        super
        @attrs = attrs
      end
  end
end
