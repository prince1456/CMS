class Admin::ModeratorsController < Admin::ApplicationController
  before_action :find_params, only: [:show, :edit, :update]
  def index
    @moderators = Moderator.all
  end
  def edit
  end
  def update
      if @moderator.update(moderator_params)
        flash[:notice] = " Moderator successfully updated"
        redirect_to admin_moderators_path
     else
       flash[:alert] = "there was a problem updating moderator"
        render 'edit'
     end
  end
  def show

  end


  private
  def find_params
      @moderator = Moderator.find(params[:id])
  end
  def moderator_params
    params.require(:moderator).permit(:id, :fullname, :username, :password)

  end
end
