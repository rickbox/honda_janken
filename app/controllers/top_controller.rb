class TopController < ApplicationController

  def index

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

     @honda_win = 0
     @honda_lose = 0
     @tweet = []
     for num in 1..16
      @client.user_timeline('pepsi_jpn',count: 200).each do |t|
        if t.text.to_s.include?("本田圭佑の勝利") then
          @honda_win += 1
          @tweet << t.created_at.to_s + t.text
        elsif t.text.to_s.include?("あなたの勝利") then
          @honda_lose += 1
          @tweet << t.created_at.to_s + t.text
        else
        end
      end
    end
  end

end
