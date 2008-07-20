# #
# @author: Dinh Hai
# #

require 'hpricot'
require 'open-uri'

class SmsController < ApplicationController
  
  def receive
    # get xml infor from SimpleWire
    # post to shouldi.spiragram.com
    url = URI.parse("http://shouldi.spiragram.com/sms/receive")

    Net::HTTP.start(url.host, url.port) do |http|
      req = Net::HTTP::Post.new(url.path)
      req.body = params.to_s
      res = http.request(req)
    end
  end
  
end