class Admin::SettingsController < Admin::ApplicationController
  def new
    add_breadcrumb "Settings", new_admin_setting_path

    if Setting.any?
      redirect_to edit_admin_setting_path(Setting.first)
    else
      @setting = Setting.new
    end
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to edit_admin_setting_path(@setting)
    else
      flash[:alert] = "there was a problem to creating setting"
      render :new
    end
  end

  def edit
    add_breadcrumb "Settings", edit_admin_setting_path

    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(setting_params)
      redirect_to :back, notice: "Successfully settings changed "
    else
      flash[:alert] = "Ops Somethings wrong for updating the settings"
      render :edit
    end
  end
  private

  def setting_params
    params.require(:setting).permit(:id, :site_name, :post_per_page,
                                    :under_mainenance, :prevent_commenting, :tag_visibility)

  end
end
