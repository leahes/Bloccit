require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:sponsored_posts) { SponsoredPost.create!(title:  RandomData.random_sentence, body: RandomData.random_paragraph, topic: my_topic) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: sponsored_posts.id, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, id: sponsored_posts.id, topic_id: my_topic.id
      expect(response).to render_template :show
    end

    it "assigns sponsored_posts to @sponsored_posts" do
      get :show, id: sponsored_posts.id, topic_id: my_topic.id
      expect(assigns(:sponsored_posts)).to eq(sponsored_posts)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status (:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsored_posts" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_posts)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: sponsored_posts.id
      expect(response).to render_template :edit
    end

    it "assigns sponsored_posts to be updated to @sponsored_posts" do
      get :edit, topic_id: my_topic.id

      sponsored_posts_instance = assigns(:sponsored_posts)

      expect(sponsored_posts_instance.id).to eq sponsored_posts.id
      expect(sponsored_posts_instance.title).to eq sponsored_posts.title
      expect(sponsored_posts_instance.body).to eq sponsored_posts.body
      end
    end
  end
end
