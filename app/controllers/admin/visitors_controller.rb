class Admin::VisitorsController < Admin::ApplicationController
  def create
    @visitor = Visitor.new(strong_params)
    if @visitor.save
      redirect_to admin_visitors_path, notice: "You make successfully a visitor"
    else
      flash[:alert] = "Oh no something is wrong"
      render :new
    end
  end

  def destroy
    @visitor = Visitor.find(params[:id])
    @visitor.destroy
    redirect_to admin_visitors_path

  end

  def edit
    @visitor =Visitor.find(params[:id])
  end
  def show
    @visitor =Visitor.find(params[:id])
  end
  def index
    add_breadcrumb "Visitors", admin_visitors_path
    @visitors = Visitor.all.order(created_at: :desc).page params[:page]
  end

  def new
    @visitor = Visitor.new
  end
  private
  def strong_params
    params.require ":visitor".permit(:fullname, :email)
  end
end
