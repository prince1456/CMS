class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    elsif params[:id]
      @post = Post.find(params[:id])
    else
      @visitor_comment = Visitor.new(comments: [Comment.new])
      @comment = Comment.new
    @posts = Post.published.page(params[:page]).per(Setting.post_per_page)
    end
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = Visitor.new(comments: [Comment.new])
    @comment = Comment.new
  end
end
