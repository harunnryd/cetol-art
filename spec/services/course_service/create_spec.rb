require 'rails_helper'

describe CourseService::Create do
  context "CourseService::Create" do
    before(:each) do
      success = -> (course) { return course }
      failure = -> (course) { return course }
      params = {
        title: 'ruby on rails',
        desc: 'I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.',
        price: 0,
      }
      @course_service = CourseService::Create.call(params, success: success, failure: failure)
    end

    it "should give success" do
      expect(@course_service.title).to eq("ruby on rails")
      expect(@course_service.desc).to eq("I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.")
      expect(@course_service.price).to eq(0)
      expect(@course_service.photo.url).to eq(nil)
    end
  end
end
