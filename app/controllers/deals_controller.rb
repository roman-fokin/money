class DealsController < UserAuth
  skip_before_action :check_authentication, only:  :new
  helper_method :coins_collection, :get_deal_resource

  def deal
    @deal = current_user.deals.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if get_deal_resource.save
      redirect_to operations_path
    else
      render 'new'
    end
  end

  def update
    if get_deal_resource.update(deal_params)
      redirect_to get_deal_resource
    else
      render 'edit'
    end
  end

  def destroy
    get_deal_resource.destroy
    redirect_to operations_path
  end

  private

  def get_deal_resource
    if params[:id]
      current_user.deals.find(params[:id])
    else
      current_user.deals.new(deal_params)
    end
  end

  def deal_params
    params[:deal] ? params.require(:deal).permit(:coin_id, :operation, :number, :sum) : {}
  end

  def coins_collection
    Coin.all.order(:title)
  end
end
