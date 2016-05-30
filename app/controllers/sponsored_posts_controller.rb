class SponsoredPostsController < ApplicationController
    def show
      @sponsored_posts = SponsoredPost.find(params[:id])
    end

    def new
      @sponsored_posts = SponsoredPost.new
    end

    def edit
      @sponsored_posts = SponsoredPost.find(params[:id])
    end

    def create
      @sponsored_posts = SponsoredPost.new
      @sponsored_posts.title = params[:sponsored_posts][:title]
      @sponsored_posts.body = params[:sponsored_posts][:body]
      @sponsored_posts = Topic.find(params[:topic_id])
      @sponsored_posts.topic = @topic

      if @sponsored_posts.save
        flash[:notice] = "Sponsored Post was saved successfully"
        redirect_to @sponsored_posts

      else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        render :new
      end

      def update
      end
    end
  end
