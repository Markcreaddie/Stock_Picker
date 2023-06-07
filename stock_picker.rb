def stock_picker(stock_prices)
    #count number of trade days and instance an empty array of the best trade days
    days= stock_prices.length
    trade_days=[]

    #buy first through each day before selling
    (0...days).reduce(Hash.new(0)) do |result, buy_day|
        #do not buy on the last day
        if buy_day!=days-1
            #only sell on days following the buy day
            (buy_day+1...days).each do |sell_day|
                #evaluate the most profitable buy-sell combination and assign that to the trade days array
                if stock_prices[sell_day]-stock_prices[buy_day] >result["profit"]
                    result["profit"]=stock_prices[sell_day]-stock_prices[buy_day]
                    trade_days=[buy_day, sell_day]
                end
            end
        end
        result
    end
    trade_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])