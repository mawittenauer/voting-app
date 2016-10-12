require 'spec_helper'
require 'rails_helper'

describe CampaignsController do
  describe "POST create" do
    context "with valid input" do
      before do
        post :create, campaign_title: "Hillary vs. Trump", side_one_title: "Trump", side_two_title: "Hillary"
      end
      it "creates a new campaign" do
        expect(Campaign.count).to eq(1)
      end
      it "creates two sides"
      it "associates both sides with the campaign"
      it "redirects to the campaign show page"
    end
    context "with invalid input"
  end
end
