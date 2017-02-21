class Admin::MessagesController < Admin::ApplicationController

  before_action :find_params, only: [:destroy, :show, :update, :edit]

  def index
    @messages = Message.all
  end

  def destroy
    @message.destroy
    redirect_to admin_messages_path
  end

  def show
  end

  def edit
  end

  def create
    message = Message.new(strong_params)
    if @message.save
      redirect_to message, notice: "you made it "
    else
      flash[:alert] = "OPS something is wrong"
      render :new
    end
  end

  def update
    if @message.save
      redirect_to @message, notice: "your message is succcessfully updated"
    else
      flash[:alert] = "OPS somethings wrong"
      render :edit
    end
  end

  private

  def strong_params
      params.require(:message).permit(:content)
  end

  def find_params
    @message = Message.find(params[:id])
  end

end
