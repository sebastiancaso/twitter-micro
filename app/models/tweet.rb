class Tweet < ActiveRecord::Base
	validates :tweet_text, presence: true
	validates :tweet_id, presence: true
end
