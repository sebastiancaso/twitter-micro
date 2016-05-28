require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  context "welcome#index" do 

    it "should create 10 tweets" do
      expect(Tweet.all.count).to eq(0)
      post :index, format: :json, tweet: 'healthcare'
      
      expect(Tweet.all.count).to eq(10)
    end

    let(:tweet) { FactoryGirl.create(:tweet) }
    it "should return the 10 most recent tweets" do
      post :index, format: :json, tweet: 'healthcare'

      oldest_returned_tweet = Tweet.find(JSON.parse(response.body)["tweets"][-1]["id"])
      expect(tweet).to_not eq(oldest_returned_tweet)
    end
  end
end
