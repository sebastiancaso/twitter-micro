class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index 
    hashtag_subject = "#" + params["tweet"]
    # this is getting based on subject, need to work on logic of sorting for correct subject that is returned.
    @tweets =  $twitter_client.search("#{hashtag_subject} -rt", lang: "en").take(10)

    check_for_updates(@tweets, params["tweet"])
      respond_to do |format|

        format.json { render json: { tweets: @tweets } }
      end
  end


  private

  def check_for_updates(tweets, tweet_subject)
    existing_tweets = Tweet.where(tweet_subject: tweet_subject).last(10) if existing_tweets
    if !existing_tweets
      tweets.each do |tweet|
        Tweet.create(tweet_text: tweet.text, tweet_subject: tweet_subject, tweet_id: tweet.id, tweet_created_at: tweet.created_at,)
      end
      existing_tweets = Tweet.where(tweet_subject: tweet_subject).last(10)
    end

    if existing_tweets && tweets[-1].created_at > existing_tweets[0].created_at || existing_tweets.count < 10 
      tweets.each do |tweet|
        puts "There are new tweets to create!"
        Tweet.create(tweet_text: tweet.text, tweet_subject: tweet_subject, tweet_id: tweet.id, tweet_created_at: tweet.created_at,)
      end
    end
    @tweets = Tweet.where(tweet_subject: tweet_subject).last(10)
  end


  def tweet_params
    params.require(:tweet).permit(:subject)
  end
end
