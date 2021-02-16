class DealsController < ApplicationController

  helper_method :coins_collection, :get_resource

  def deal
    @deal = Deal.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    if get_resource.save
      redirect_to operations_path
    else
      render 'new'
    end
  end

  def update
    if get_resource.update(deal_params)
      redirect_to get_resource
    else
      render 'edit'
    end
  end

  def destroy
    get_resource.destroy
    redirect_to operations_path
  end

  private

  def get_resource
    if params[:id]
      Deal.find(params[:id])
    else
      Deal.new(deal_params)
    end
  end

  def deal_params
    params[:deal] ? params.require(:deal).permit(:coin, :operation, :number, :sum) : {}
  end

  def coins_collection
    Coin.all.order(:title).pluck('title')
  end
end
