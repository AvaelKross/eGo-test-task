require 'rails_helper'

RSpec.describe Generator, type: :model do
  
  describe 'generate_users' do
    it "should create users" do
      expect{Generator.send(:generate_users, 5)}.to change{User.count}.by(5)
    end
  end

  describe 'generate_records' do
    before(:all) { User.create([{login: 'qwe', name: 'qweqwe'}, {login: 'petr', name: 'megakiller'}]) }
    it "should create records" do
      expect{Generator.send(:generate_records, 5)}.to change{Record.count}.by(5)
    end
  end

end
