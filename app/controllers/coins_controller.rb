class CoinsController < ApplicationController

  helper_method :get_resource

  def index
    @coin = Coin.all
  end

  def show; end

  def new; end

  def edit; end

  def update
    if get_resource.update(coin_params)
      redirect_to get_resource
    else
      render 'edit'
    end
  end

  def destroy
    get_resource.destroy
    redirect_to coins_path
  end

  def create
    if get_resource.save
      redirect_to get_resource
    else
      render 'new'
    end
  end

  private

  def get_resource
    if params[:id]
      Coin.find(params[:id])
    else
      Coin.new(coin_params)
    end
  end

  def coin_params
    params[:coin] ? params.require(:coin).permit(:title, :ticker) : {}
  end
end
