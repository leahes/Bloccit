require 'rails_helper'

 RSpec.describe Api::V1::PostsController, type: :controller do
   let(:my_user) { create(:user) }
   let(:my_post) { create(:post) }
   let(:my_topic) { my_post.topic }

  before do
    my_user.admin!
    controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    @new_post = build(:post)
  end

   describe "POST create" do
     before { post :create, post: {title: @new_post.title, body: @new_post.body}, topic_id: my_topic.id }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq 'application/json'
     end

     it "creates a post with the correct attributes" do
       hashed_json = JSON.parse(response.body)
       expect(hashed_json["title"]).to eq(@new_post.title)
       expect(hashed_json["body"]).to eq(@new_post.body)
     end
   end

   describe "DELETE destroy" do
     before { delete :destroy, id: my_post.id, topic_id: my_topic.id }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq 'application/json'
     end

     it "returns the correct json success message" do
       expect(response.body).to eq({ message: "Post destroyed", status: 200 }.to_json)
     end

     it "deletes my_post" do
       expect{ Post.find(my_post.id) }.to raise_exception(ActiveRecord::RecordNotFound)
     end
   end

   describe "PUT update" do
     before { put :update, id: my_post.id, post: { title: @new_post.title, body: @new_post.body}, topic_id: my_post.id }

     it "returns http success" do
       expect(response).to have_http_status(:success)
     end

     it "returns json content type" do
       expect(response.content_type).to eq 'application/json'
     end


     it "updates a post with the correct attributes" do
       updated_post = Post.find(my_post.id)
       expect(response.body).to eq(updated_post.to_json)
     end
   end
 end
