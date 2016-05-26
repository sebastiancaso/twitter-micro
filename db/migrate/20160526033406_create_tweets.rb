class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet_text, :tweet_subject
      t.integer :tweet_id, limit: 8
      t.datetime :tweet_created_at

      t.timestamps null: false
    end
  end
end
