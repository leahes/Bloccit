require 'rails_helper'

RSpec.describe Favourite, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:favourite) { Favourite.create!(post: post, user: user) }

   it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }
end
