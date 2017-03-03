# class ResponsesController < ApplicationController
#   def index
#   end
#
#   def show
#   end
#
#   def new
#     @user = User.find(params[:user_id])
#     @bar = Bar.find(params[:bar_id])
#     @post = Post.new
#     redirect_to all_posts_path(current_user) if current_user != @bar.user
#   end
#
#   def create
#     #@post = @bar.posts.new(post_params)
#     @user = User.find(params[:user_id])
#     # @user = current_user
#     # @bar = @user.bars.find(params[:bar_id])
#     #@bar = Bar.find(params[:bar_id])
#     # @post = @bar.posts.new(post_params)
#
#     @bar = Bar.find(params[:bar_id])
#     @post = Post.find(params[:post_id])
#     @response = Response.create(response_params)
#     @response.user_id = @user.id
#     @response.post_id = @bar.id
#
#     if @post.save
#       redirect_to user_bar_posts_path(@user, @bar)
#     else
#       render :new
#     end
#   end
#
#   def edit
#     @bar = Bar.find(params[:bar_id])
#     @user = User.find(params[:user_id])
#     @post = Post.find(params[:id])
#   end
#
#   def update
#     @bar = Bar.find(params[:bar_id])
#     @user = User.find(params[:user_id])
#     @post = Post.find(params[:id])
#     #@bar = Bar.find(params[:id])
#
#     if @post.update_attributes(post_params)
#       redirect_to user_bar_post_path(@post)
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @post = Post.find(params[:id])
#     @post.destroy
#     redirect_to all_posts_path(@post)
#   end
#
#   private
#   def post_params
#   params.require(:post).permit(:contents, :date, :time, :location, :user_id, :bar_id)
#   end
#
#   def set_post
#   @post = Post.find(params[:id])
#   end
#
#   end
#
# end
