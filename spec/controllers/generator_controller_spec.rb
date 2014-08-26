require 'rails_helper'

RSpec.describe GeneratorController, type: :controller do

  describe "#generate" do

    it "should generate users" do
      expect{post :generate, users_count: 5}.to change{User.count}.by(5)
    end

    it "should generate records" do
      User.create(login: 'qwe', name: 'qweqwe')
      expect{post :generate, records_count: 5}.to change{Record.count}.by(5)
    end

  end

end