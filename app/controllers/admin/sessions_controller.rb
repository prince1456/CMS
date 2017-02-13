class Admin::SessionsController < Admin::ApplicationController
    before_action :authorize, except: [:new, :create]
    def new
    end

    def destroy
      session[:current_moderator_id] = nil
      redirect_to '/login', notice: "you have successfully logged out"
    end

    def create
        @moderator = Moderator.find_by(username: params[:username]).try(:authenticate, params[:password])
        if @moderator
            session[:current_moderator_id] = @moderator.id
            redirect_to admin_moderators_path, notice: ' you have successfully signed in'
        else
            flash[:alert] = 'wrong information'
            render :new
        end
    end
end
