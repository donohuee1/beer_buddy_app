class BarsController < ApplicationController
  def index
  @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
  @bar = Bar.new
  end

  def create
  @bar = Bar.new(params.require(:bar).permit(:bar_name, :location, :phone_number))

  if @bar.save
    redirect_to bars_path
  else
    render :new
  end
  end

  def edit
  @bar = Bar.find(params[:id])
  end

  def update
  @bar = Bar.find(params[:id])

  if @bar.update_attributes(params.require(:bar).permit(:bar_name, :location, :phone_number))
    redirect_to bars_path
  else
    render :edit
  end
end

def destroy
  @bar = Bar.find(params[:id])
  @bar.destroy
  redirect_to users_path
end

end
