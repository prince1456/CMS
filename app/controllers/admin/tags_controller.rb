class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
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

  def destroy
    @tag = Tag.find[params[:id]]
    @tag.destroy
  end
  private
  def strong_tag
    params.require(:tag).permit(:id,:name)
  end
end
