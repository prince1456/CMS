class Admin::CommentsController < Admin::ApplicationController
  def index
    add_breadcrumb "List Comments", admin_comments_path
    if params[:search].present?
      @comments = Comment.search_comments(params[:search]).page params[:page]
    else
      @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back, notice: "successfully deleted comment"
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(status: params[:status])
      redirect_to :back, notice: "successfully update comment"
    else
      redirect_to :back, notice: "Somethings wrong"
    end
  end
end
