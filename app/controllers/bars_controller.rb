class BarsController < ApplicationController
  before_action :set_bar, only: [:update, :index, :show, :new, :create]

  # def all_user_bars
  #   @user = User.find(session[:user_id])
  #   @bars = Bar.find(params[:id])
  # end

  def index
    @user = User.find(session[:user_id])
    @bars = Bar.all
  end

  def show
    @user = User.find(session[:user_id])
    @bar = Bar.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @bar = Bar.new
  end

  def create
  @user = User.find(params[:user_id])
  @bar = Bar.new(bar_params)

  if @bar.save
    redirect_to user_bars_path(current_user)
  else
    render :new
  end
  end

  def edit
  @bar = Bar.find(params[:id])
  end

  def update
  @bar = Bar.find(params[:id])

  if @bar.update_attributes(bar_params)
    redirect_to user_bars_path(current_user)
  else
    render :edit
  end
end

def destroy
  @bar = Bar.find(params[:id])
  @bar.destroy
  redirect_to user_bars_path
end

private
def bar_params
  # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  # that can be submitted by a form to the user model #=> require(:user)
  params.require(:bar).permit(:bar_name, :location, :phone_number)
end

def set_bar
  @bar = Bar.find(session[:user_id])
end

end
