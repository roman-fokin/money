class CoinsController < ApplicationController

    def index
        @coin = Coin.all
    end

    def new
        @coin = Coin.new
    end

    def show
        @coin = Coin.find(params[:id])
    end

    def edit
        @coin = Coin.find(params[:id])
    end

    def update
        @coin = Coin.find(params[:id])

        if (@coin.update(coin_params))
            redirect_to @coin
        else
            render 'edit'
        end
    end

    def destroy
        @coin = Coin.find(params[:id])
        @coin.destroy
        redirect_to coins_path
    end

    def create
        @coin = Coin.new(coin_params)
        if (@coin.save)
            redirect_to @coin
        else
            render 'new'
        end
    end

    private def coin_params
        params.require(:coin).permit(:title, :ticker)
    end
    
end