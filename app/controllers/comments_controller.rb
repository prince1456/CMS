class CommentsController < ApplicationController
  def create
    if visitor.save
      flash[:notice] = "Succesfully created new comment"
    else
      flash[:alert] = "somethings wrong for save the comment"
  end
  redirect_to :back
  end

  private

    def visitor_comments_params
      params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
    end
    def visitor
       VisitorCommentService.new(visitor_comments_params).visitor
    end
end
