require 'rails_helper'

describe Courses::Create do
  context "Courses::Create" do
    before(:each) do
      params = {
        title: 'ruby on rails',
        desc: 'what do you think about me',
        price: 0,
        photo: File.open(Rails.public_path + "ktp.png")
      }
      @form = Courses::Create.(params)
    end

    it "should be given error" do
      expect(@form.valid?).to eq(false)
      expect(@form.errors.full_messages).to contain_exactly("Photo should be less than 500kb")
    end
  end
end
