class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index 
    hashtag_subject = "#" + params["tweet"]

    @tweets =  $twitter_client.search("#{hashtag_subject} -rt", lang: "en").take(10)

    check_or_create_tweets(@tweets, params["tweet"])
    respond_to do |format|

      format.json { render json: { tweets: @tweets } }
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:subject)
  end

  def check_or_create_tweets(tweets, tweet_subject)

    tweets.each do |tweet|
      Tweet.where(tweet_text: tweet.text, tweet_subject: tweet_subject, tweet_id: tweet.id, tweet_created_at: tweet.created_at).first_or_create
    end

    @tweets = Tweet.where(tweet_subject: tweet_subject).last(10)
  end
end

