class Admin::PostsController < Admin::ApplicationController

    def index
        add_breadcrumb "All posts", admin_posts_path
        if params[:search].present?
          @posts = Post.matching_title_or_content(params[:search]).page params[:page]
        else
          @posts = Post.all.order(id: :desc).page params[:page]
        end
    end

    def new
        add_breadcrumb "New Post", new_admin_post_path
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @moderator = current_moderator
        @post.moderator = @moderator
        if @post.save
            redirect_to admin_posts_path, notice: 'you publish successfully a post'
        else
            flash[:alert] = 'Somethings is wrong'
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to admin_posts_path, notice: 'updated successfully'
        else
            flash[:alert] = 'please enter right informations'
            render :edit
        end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to admin_posts_path
    end

    def show
      @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :publish, :image ,tag_ids: []  )
    end
end
