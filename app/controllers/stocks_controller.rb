class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    puts "COMPANY ----< #{params[:company]}"
    json = Stock.lookup(@stock.company)
    json = JSON.parse(json)
    json = json["ResultSet"]["Result"][0]
    @stock.ticker = json["symbol"]
    @stock.company = json["name"]
    @stock.price = Stock.price(json["symbol"])

    if @stock.save
      redirect_to stock_path(@stock.id)
    else
      redirect_to root_path
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to :back
  end

  def text
    if Stock.text(params[:id])
      redirect_to :back
    else
      redirect_to root_path
    end
  end

private

    def stock_params
        params.require(:stock).permit(:company, :owned, :watching, :ticker, :price, :user_id)
    end


end
