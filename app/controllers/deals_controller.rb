class DealsController < UserAuth
  skip_before_action :check_authentication, only:  :new
  helper_method :coins_collection, :get_deal_resource, :get_coin_price

  def deal
    @deal = current_user.deals.all
  end

  def show
  end

  def new
    get_coin_price('Bitcoin')
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

  def get_coin_price(coin_name)
    url = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
    parameters = { 
      start: '1',
      limit: '5000',
      convert: 'USD',
    }

    # b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c - test
    # 8226298f-100f-4af4-aa49-c8630d4ed0fd - pro

    response = HTTParty.get(url, query: parameters, headers: { 
      'Accept' => 'application/json',
      'X-CMC_PRO_API_KEY' => 'b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c'
    })

    data = JSON.parse response.body
    @data = data['data'].find{|hsh| hsh['name'] == coin_name}
  end
end
