require "market_beat"
class Stock < ActiveRecord::Base
  belongs_to :user

    def self.price(ticker)
        result = MarketBeat.last_trade_real_time(ticker)
        return result
    end

    def self.lookup(company)
        url = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{company}&callback=YAHOO.Finance.SymbolSuggest.ssCallback"
        response = Net::HTTP.get_response(URI.parse(url))
        response.body[39..-2]
    end

    def self.text(stock)
        stock = Stock.where(:id => stock).first
        user_id = stock.user_id
        user = User.where(:id => user_id).first
        phone = user.phone
        account_sid = "AC35d0abacd00f2ffcc065ca1d53c8b930"
        auth = "0b1863df59c77930f6d4a12352be5679"
        begin
            client = Twilio::REST::Client.new(account_sid, auth)
            response = client.account.messages.create( {
                :body => "This is your test Stock Tracking email",
                :to => phone,
                :from => "+19147757419",
            })

            puts response.body
        rescue Twilio::REST::RequestError => e
            puts e.message
            return false
        end
        return true
    end


end

