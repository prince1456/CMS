class Admin::PagesController < Admin::ApplicationController
  before_action :find_params, only:[:show, :destroy, :update, :edit]
  def index
    @pages = Page.all
  end

  def show
  end

  def edit
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new strong_params
    if page.save
      redirect_to admin_pages_path, notice: "successfully created a page"
    else
      flash[:notice] = "somethings is wrong"
      render :new
    end
  end

  def update
     @page.update(strong_params)
     redirect_to admin_pages_path

  end

  def destroy
  end
  private
  def find_params
    @page = Page.find(params[:id])
  end
  def strong_params
    params.require(:page).permit(:title, :content, :status)
  end
end
