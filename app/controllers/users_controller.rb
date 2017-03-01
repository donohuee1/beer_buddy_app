class UsersController < ApplicationController

  def index
  @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  @user = User.new
  end

  def create
  @user = User.new(user_params)

  # stores all emails in lowercase to avoid duplicates and case-sensitive login errors:
  @user.email.downcase!

  if @user.save
    # If user saves in the db successfully:
    flash[:notice] = "Account created successfully!"
    redirect_to root_path
  else
    # If user fails model validation - probably a bad password or duplicate email:
    flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
    render :new
  end
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
    if current_user.id == @user.id

      @user.update_attributes(user_params)
      redirect_to users_path

    else
      flash[:notice] = "You are not authorized!"
      redirect_to request.referrer
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :age)
  end

  # def lite_user_params
  #   # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  #   # that can be submitted by a form to the user model #=> require(:user)
  #   params.require(:user).except!(:password, :password_confirmation)
  # end

end
