module Courses
  class Create < FormObject
    attr_reader(:attrs)
    attr_accessor(:title, :desc, :price, :photo)

    def self.call(attrs = {})
      new(attrs)
    end

    def self.method_missing(name, *args)
      result =  "undefined method :#{name}"
      result.concat(" ", "with argument (#{args.join(',')})") if args.present?
      result
    end

    validates :title, :desc, :price, presence: true
    validates :price, numericality: { greater_than_equal: 0 }
    validates :photo, attachment: true

    private
      def initialize(attrs = {})
        super
        @attrs = attrs
      end
  end
end
