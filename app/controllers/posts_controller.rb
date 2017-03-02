class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy, :show, :edit]

  def index
    #@user = User.find(params[:user_id])
    #@bar = Bar.find(params[:bar_id])
    @posts = Post.all
  end

  def show
    @bar = Bar.find(params[:bar_id])
    @post = Post.find(params[:id])
  end

  def new
    @bar = Bar.find(params[:bar_id])
    @post = @bar.posts.new
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @post = @bar.posts.new(post_params)

    if @post.save
      redirect_to bar_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    #@bar = Bar.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    #@bar = Bar.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to bar_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to bar_posts_path
  end

private
def post_params
  params.require(:post).permit(:bar_name, :contents, :date, :time, :location, :user_id)
end

def set_post
  @post = Post.find(params[:id])
end

end
