require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:questions) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false)}

    it "should respond to title" do
        expect(questions).to respond_to(:title)
      end

    it "should respond to body" do
        expect(questions).to respond_to(:body)
      end

    it "should respond to resolved" do
        expect(questions).to respond_to(:resolved)
      end
    end
