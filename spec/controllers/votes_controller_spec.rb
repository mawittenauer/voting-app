require 'spec_helper'
require 'rails_helper'

describe VotesController do
  describe "POST create" do
    it "redirects to sign in page for unauthenticated users" do
      post :create, side_id: 1, campaign_id: 1
      expect(response).to redirect_to sign_in_path
    end
    
    context "with valid input" do
      let(:user) { Fabricate(:user) }
      let(:campaign) { Fabricate(:campaign) }
      let(:side_one) { Fabricate(:side, campaign_id: campaign.id) }
      let(:side_two) { Fabricate(:side, campaign_id: campaign.id) }
      before do
        session[:user_id] = user.id
        post :create, campaign_id: campaign.id, side_id: side_two.id
      end
      it "redirects to the campaign show page" do
        expect(response).to redirect_to campaign
      end
      it "creates a new vote" do
        expect(Vote.count).to eq(1)
      end
      it "associated the vote to the side"
      it "associates the vote to the signed in user"
    end
    context "with invalid input"
  end
end
