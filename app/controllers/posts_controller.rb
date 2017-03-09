class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    elsif params[:id]
      @post = Post.friendly.find(params[:id])
    else
      @posts2 = Post.last(5)
      @visitor_comment = Visitor.new(comments: [Comment.new])
      @comment = Comment.new
    @posts = Post.published.page(params[:page]).per(Setting.post_per_page)
    end
  end

  def show
    @posts2 = Post.last(5)
    @post = Post.friendly.find(params[:id])
    @visitor_comment = Visitor.new(comments: [Comment.new])
    @comment = Comment.new
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end


end
