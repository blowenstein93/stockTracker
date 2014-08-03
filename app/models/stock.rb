require "market_beat"
class Stock < ActiveRecord::Base

    def self.price(ticker)
        result = MarketBeat.last_trade_real_time(ticker)
        return result
    end

    def self.lookup(company)
        url = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{company}&callback=YAHOO.Finance.SymbolSuggest.ssCallback"
        response = Net::HTTP.get_response(URI.parse(url))
        response.body[39..-2]
    end

end

