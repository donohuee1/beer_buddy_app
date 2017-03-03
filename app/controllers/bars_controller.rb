class BarsController < ApplicationController
  before_action :set_bar, only: [:update, :destroy, :show, :edit]

  def index
    #@user = User.find(params[:user_id])
    @bars = Bar.all
  end

  def users_index
    @user = User.find(params[:user_id])
    @bars = @user.bars.all
  end

  def show
    @bar = Bar.find(params[:id])
    @user = User.find(@bar.user_id)
  end

  def new
    @user = User.find(params[:user_id])
    @bar = Bar.new
  end

  def create
  @user = User.find(params[:user_id])
  @bar = @user.bars.new(bar_params)

  if @bar.save
    redirect_to user_bars_path
  else
    render :new
  end
  end

  def edit
  @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @user = User.find(@bar.user_id)
  #@user = User.find(params[:user_id])

  if @bar.update_attributes(bar_params)
    redirect_to bar_path
  else
    render :edit
  end
end


def destroy
  @bar = Bar.find(params[:id])
  #if @bar == current_user
    @bar.destroy
    #redirect_to users_path(current_user)
  #else
    redirect_to users_path
  #end
end

private
def bar_params
  # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  # that can be submitted by a form to the user model #=> require(:user)
  params.require(:bar).permit(:bar_name, :location, :phone_number, :user_id)
end

def set_bar
  @bar = Bar.find(params[:id])
end

end
