class DealsController < ApplicationController
    def deal
        @deal = Deal.all
    end

    def show
        @deal = Deal.find(params[:id])
    end

    def new
        @deal = Deal.new
    end

    def create
        @deal = Deal.new(deal_params)
        if (@deal.save)
            redirect_to @deal
        else
            render 'new'
        end
    end

    def edit
        @deal = Deal.find(params[:id])
    end

    def update
        @deal = Deal.find(params[:id])

        if (@deal.update(deal_params))
            redirect_to @deal
        else
            render 'edit'
        end
    end

    def destroy
        @deal = Deal.find(params[:id])
        @deal.destroy
        redirect_to operations_path
    end

    private def deal_params
        params.require(:deal).permit(:coin, :operation, :number, :sum)
    end

    helper_method :coins_collection
    
    def coins_collection
        @coins_collection = Coin.all.order(:title).pluck('title')
    end
   

end



