class Admin::TagsController < Admin::ApplicationController
  def new
    add_breadcrumb "Tags", new_admin_tag_path

    @tag = Tag.new
    @tags = Tag.all.order(created_at: :DESC).page params[:page]
  end
  def index
    @tags = Tag.all.order(created_at: :DESC)
  end
  def create
    strong_tag[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_path, notice: "Tag was successfully created"
  end
  def edit
    @tag = Tag.find(params[:id])
  end
  def update
    @tag = Tag.find(params[:id])
    if @tag.update strong_tag
      redirect_to new_admin_tag_path, notice: "successfully updated tag"
    else
      flash[:alert] = "There was a problem updating tag"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to :back
  end

  private
  def strong_tag
    params.require(:tag).permit(:id,:name)
  end
end
