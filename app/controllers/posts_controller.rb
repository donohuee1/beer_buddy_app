class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy, :show, :edit]

  def index
    #@user = User.find(params[:user_id])
    #@bar = Bar.find(params[:bar_id])
    #@posts = params[:bar_id] ? Bar.find(params[:bar_id]).posts : Post.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @bar = Bar.find(params[:bar_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @bar = Bar.find(params[:bar_id])
    @post = Post.new
    redirect_to all_posts_path(current_user) if current_user != @bar.user
  end

  def create
    #@post = @bar.posts.new(post_params)
    @user = User.find(params[:user_id])
    # @user = current_user
    # @bar = @user.bars.find(params[:bar_id])
    #@bar = Bar.find(params[:bar_id])
    # @post = @bar.posts.new(post_params)

    @bar = Bar.find(params[:bar_id])
    @post = Post.create(post_params)
    @post.user_id = @user.id
    @post.bar_id = @bar.id

    if @post.save
      redirect_to user_bar_posts_path(@user, @bar)
    else
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:bar_id])
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:bar_id])
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    #@bar = Bar.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to bars_path  
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to all_posts_path
  end

private
def post_params
  params.require(:post).permit(:contents, :date, :time, :location, :user_id, :bar_id)
end

def set_post
  @post = Post.find(params[:id])
end

end
