class Admin::MessagesController < Admin::ApplicationController

  before_action :find_params, only: [:destroy, :show, :update, :edit]

  def index
    if params[:search].present?
      @messages = Message.search_message(params[:search]).page params[:page]
    else
      @messages = Message.all.order(created_at: :DESC).page params[:page]
    end

  end

  def destroy
    @message.destroy
    redirect_to admin_messages_path
  end

  def show
    @message.mark_read
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
      @message.update(status: params[:status])
      redirect_to :back, notice: "your message is succcessfully updated"
  end

  private

  def strong_params
      params.require(:message).permit(:content, :status)
  end

  def find_params
    @message = Message.find(params[:id])
  end

end
