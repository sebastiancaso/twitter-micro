require 'rails_helper'

describe Tweet, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:tweet_subject) }
    it { is_expected.to validate_presence_of(:tweet_text) }
  end
end
